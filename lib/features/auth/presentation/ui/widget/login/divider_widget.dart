import 'package:fitness_app/core/theme/colors.dart';
import 'package:fitness_app/core/widget/small_text.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Divider(
            thickness: 2,
            color: ColorsManager.grayColor3,
            endIndent: 10,
          ),
        ),
        SmallText(
          data: 'Or',
        ),
        const Expanded(
          child: Divider(
            thickness: 2,
            color: ColorsManager.grayColor3,
            indent: 10,
          ),
        ),
      ],
    );
  }
}

