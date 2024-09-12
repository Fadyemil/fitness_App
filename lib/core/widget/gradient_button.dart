// ignore_for_file: must_be_immutable

import 'package:fitness_app/core/theme/colors.dart';
import 'package:fitness_app/core/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  IconData? iconData;

  GradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              ColorsManager.brandColors2,
              ColorsManager.brandColors1,
            ], // ألوان التدرج
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            BigText(
              data: text,
              size: 16,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
