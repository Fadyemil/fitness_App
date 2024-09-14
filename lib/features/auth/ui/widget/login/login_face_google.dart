import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFace_Google extends StatelessWidget {
  LoginFace_Google({
    super.key,
  });
  final List<String> imageLogin = [
    'assets/image/google_logo.png',
    'assets/image/facebook 1.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 50.h,
          width: 50.w,
          margin: EdgeInsets.only(right: 30.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              width: 0.8,
              color: Color(0xffDDDADA),
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(imageLogin[index]),
            ),
          ),
        );
      },
    );
  }
}
