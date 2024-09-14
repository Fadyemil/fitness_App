import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class PassValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PassValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildValidationIcon(
                Symbols.lowercase, hasLowerCase, 'Lowercase letter'),
            buildValidationIcon(
                Symbols.uppercase, hasUpperCase, 'Uppercase letter'),
            buildValidationIcon(Symbols.numbers, hasNumber, 'Number'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildValidationIcon(
                Icons.star, hasSpecialCharacters, 'Special character'),
            SizedBox(height: 4.h),
            buildValidationIcon(Icons.format_list_numbered, hasMinLength,
                'At least 8 characters'),
          ],
        ),
      ],
    );
  }

  Widget buildValidationIcon(IconData icon, bool isValid, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.sp,
          color: isValid ? const Color(0xFF757575) : const Color(0xFF242424),
        ),
        SizedBox(width: 4.w), // Add space between icon and text
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: isValid ? const Color(0xFF757575) : const Color(0xFF242424),
            decoration: isValid ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}
