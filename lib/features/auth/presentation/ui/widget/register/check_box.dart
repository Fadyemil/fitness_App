import 'package:fitness_app/core/widget/small_text.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      title: Wrap(
        children: [
          SmallText(data: 'By continuing you accept our'),
          SmallText(
            data: ' Privacy Policy',
            isDecoration: true,
          ),
          SmallText(data: ' and'),
          SmallText(
            data: ' Term of Use',
            isDecoration: true,
          )
        ],
      ),
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(value);
      },
      controlAffinity: ListTileControlAffinity.platform,
    );
  }
}
