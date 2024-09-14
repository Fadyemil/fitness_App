import 'package:fitness_app/core/helpers/app_regex.dart';
import 'package:fitness_app/core/widget/app_text_from_field.dart';
import 'package:fitness_app/features/auth/logic/login/login_cubit.dart';
import 'package:fitness_app/features/auth/ui/widget/login/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FormEmailPassword extends StatefulWidget {
  const FormEmailPassword({
    super.key,
  });

  @override
  State<FormEmailPassword> createState() => _FormEmailPasswordState();
}

class _FormEmailPasswordState extends State<FormEmailPassword> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    // Set up the listener for the password text field
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    // Add a listener to the text field to monitor changes in the password input
    passwordController.addListener(() {
      setState(() {
        // Check if the password contains at least one lowercase letter
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        // Check if the password contains at least one uppercase letter
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        // Check if the password contains at least one special character
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        // Check if the password contains at least one number
        hasNumber = AppRegex.hasNumber(passwordController.text);
        // Check if the password has a minimum length of 8 characters
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            backgroundColor: Color(0xffF7F8F8),
            prefixIcon: Icon(
              Iconsax.sms,
              size: 25.sp,
            ),
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            backgroundColor: Color(0xffF7F8F8),
            isObscureText: isObscureText,
            prefixIcon: Icon(
              Iconsax.lock,
              size: 25.sp,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  //  @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
