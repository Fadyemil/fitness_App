import 'package:fitness_app/core/theme/colors.dart';
import 'package:fitness_app/features/login/ui/screen/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' Login',
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorsManager.secondaryColor1,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
          ),
        ],
      ),
    );
  }
}
