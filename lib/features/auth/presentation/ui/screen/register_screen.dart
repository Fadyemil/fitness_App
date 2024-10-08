import 'package:fitness_app/features/auth/presentation/ui/widget/login/divider_widget.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/login/login_face_google.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/register/app_bar_register.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/register/check_box.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/register/form_register.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/register/have_account.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
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
              AppBarRegister(),
              SizedBox(height: 40.h),
              FormRegister(),
              SizedBox(height: 20.h),
              CheckBox(
                isChecked: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
              SizedBox(height: 20.h),
              if (isChecked) RegisterBloc(),
              SizedBox(height: 20.h),
              const DividerWidget(),
              SizedBox(height: 20.h),
              SizedBox(
                width: 130.w,
                height: 50.h,
                child: LoginFace_Google(),
              ),
              SizedBox(height: 20.h),
              const HaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
