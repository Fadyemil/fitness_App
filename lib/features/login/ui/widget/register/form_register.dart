import 'package:fitness_app/core/helpers/app_regex.dart';
import 'package:fitness_app/core/widget/app_text_from_field.dart';
import 'package:fitness_app/features/login/logic/register/register_cubit.dart';
import 'package:fitness_app/features/login/ui/widget/register/pass_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
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
    passwordController = context.read<RegisterCubit>().passwordController;
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
      key: context.read<RegisterCubit>().registerFormKey,
      child: Column(
        children: [
          //~ Field Fist Name
          AppTextFormField(
            controller: context.read<RegisterCubit>().firetNameController,
            hintText: 'First Name',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Please enter a valid name';
              }
            },
            backgroundColor: Color(0xffF7F8F8),
            prefixIcon: Icon(
              Iconsax.profile_circle,
              size: 25.sp,
            ),
          ),
          SizedBox(height: 16.h),
          //~ Field Last Name
          AppTextFormField(
            controller: context.read<RegisterCubit>().lastNAmeController,
            hintText: 'Last Name',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Please enter a valid name';
              }
            },
            backgroundColor: Color(0xffF7F8F8),
            prefixIcon: Icon(
              Iconsax.profile_circle,
              size: 25.sp,
            ),
          ),
          SizedBox(height: 16.h),
          //~ Field Email
          AppTextFormField(
            controller: context.read<RegisterCubit>().emailController,
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
          //~ Field Password
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
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
          //~ Validations Password
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: PassValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   // Remove the listener when the widget is disposed
  //   super.dispose();
  //   passwordController.dispose();
  // }
}
