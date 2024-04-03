import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/theme/const.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Color color;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? enableInteractiveSelection;

  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    required this.onChanged,
    required this.color,
    this.keyboardType,
    this.maxLines,
    this.enableInteractiveSelection,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      enableInteractiveSelection: enableInteractiveSelection,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      padding: EdgeInsets.all(16.r),
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      placeholder: placeholder,
      controller: controller,
    );
  }
}
