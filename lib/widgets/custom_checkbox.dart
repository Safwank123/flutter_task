import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.blue,
         // hoverColor:  Colors.blue,

          side: BorderSide(color: Colors.grey),
        focusColor: Colors.grey,
          value: value,
          onChanged: onChanged,
        ),
        if (label != null && label!.isNotEmpty)
          Text(
            label!,
            style: TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
