import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/theme/const.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isActive;
  final Color? color;
  final Color? textColor;
  final String? iconAsset;
  final EdgeInsets? padding;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isActive,
    this.color,
    this.iconAsset,
    this.padding,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoButton(
            padding: padding,
            borderRadius: borderRadius,
            color: color ?? accentColor,
            disabledColor: disabledColor,
            onPressed: isActive ? onPressed : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconAsset != null)
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconAsset!,
                        colorFilter: ColorFilter.mode(
                          isActive ? Colors.white : disabledTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: isActive
                        ? textColor ?? Colors.white
                        : disabledTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
