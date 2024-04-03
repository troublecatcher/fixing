import 'package:flutter/cupertino.dart';
import 'package:fixease/theme/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? color;

  const CustomTextButton(
      {super.key, required this.title, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      disabledColor: disabledColor,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: color ?? accentColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
