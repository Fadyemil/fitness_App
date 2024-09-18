import 'package:fitness_app/core/widget/small_text.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/login/app_bar_login.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/login/create_account.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/login/divider_widget.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/login/form_email_password.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/login/login_bloc_consumer.dart';
import 'package:fitness_app/features/auth/presentation/ui/widget/login/login_face_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
              LoginBlocConsumer(),
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

