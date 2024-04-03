import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixease/theme/const.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;

  const CustomContainer(
      {super.key, required this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? primaryColor,
        borderRadius: borderRadius,
      ),
      padding: padding ?? EdgeInsets.all(16.r),
      child: child,
    );
  }
}
