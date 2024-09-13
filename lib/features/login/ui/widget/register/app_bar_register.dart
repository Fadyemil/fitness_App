import 'package:fitness_app/core/widget/big_text.dart';
import 'package:fitness_app/core/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarRegister extends StatelessWidget {
  const AppBarRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SmallText(
            data: 'Hey there,',
            size: 16,
            color: Color(0xff1D1617),
          ),
          SizedBox(height: 8.h),
          BigText(data: 'Create an Account', size: 20)
        ],
      ),
    );
  }
}