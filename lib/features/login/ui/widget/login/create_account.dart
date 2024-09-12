
import 'dart:ui';

import 'package:fitness_app/core/theme/colors.dart';
import 'package:fitness_app/features/home/ui/screen/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don’t have an account yet?',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' Register',
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorsManager.secondaryColor1,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}

