import 'dart:developer';

import 'package:fitness_app/core/widget/gradient_button.dart';
import 'package:fitness_app/core/widget/small_text.dart';
import 'package:fitness_app/features/auth/logic/login/login_cubit.dart';
import 'package:fitness_app/features/auth/ui/widget/login/app_bar_login.dart';
import 'package:fitness_app/features/auth/ui/widget/login/create_account.dart';
import 'package:fitness_app/features/auth/ui/widget/login/divider_widget.dart';
import 'package:fitness_app/features/auth/ui/widget/login/form_email_password.dart';
import 'package:fitness_app/features/auth/ui/widget/login/login_face_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8F8),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 45.h),
              const AppBarLogin(),
              SizedBox(height: 40.h),
              const FormEmailPassword(),
              SizedBox(height: 8.h),
              TextButton(
                isSemanticButton: false,
                onPressed: () {},
                child: SmallText(
                  data: 'Forgot your password?',
                  color: const Color(0xffADA4A5),
                  size: 12,
                ),
              ),
              SizedBox(height: 20.h),
              GradientButton(
                text: 'Login',
                onPressed: () {
                  if (context
                      .read<LoginCubit>()
                      .loginFormKey
                      .currentState!
                      .validate()) {
                    log('*****************************************Done login for you!******************************** ');
                  } else {
                    log('*****************************************NO******************************** ');
                  }
                },
                iconData: Iconsax.login,
              ),
              SizedBox(height: 20.h),
              const DividerWidget(),
              SizedBox(height: 20.h),
              SizedBox(
                width: 130.w,
                height: 50.h,
                child: LoginFace_Google(),
              ),
              SizedBox(height: 20.h),
              const CreateAccount(),
            ],
          ),
        ),
      ),
    );
  }
}


/**
 * ElevatedButton(
          onPressed: () async {
            // Simulate login success
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true); // Save login status

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text('Login'),
        ),
 */
