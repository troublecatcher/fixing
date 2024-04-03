import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/theme/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Function(BuildContext) onPressed;

  const SettingsItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Builder(builder: (ctx) {
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => onPressed(ctx),
              child: CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: accentColor,
                    ),
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
