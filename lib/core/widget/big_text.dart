// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    required this.data,
    this.color = const Color(0xff1D1617),
    this.size = 24,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.bold,
    this.isOverflow = true,
  });
  final String data;
  Color? color;
  double size;
  TextOverflow overflow;
  FontWeight? fontWeight;
  bool isOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: isOverflow ? 1 : null,
      overflow: isOverflow ? overflow : null,
      style: TextStyle(
        fontSize: size.sp,
        color: color,
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
      ),
    );
  }
}
