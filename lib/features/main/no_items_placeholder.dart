import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/theme/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoItemsPlaceholder extends StatelessWidget {
  const NoItemsPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: borderRadius,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Image.asset(
                    'assets/images/cog1.png',
                    scale: 7,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No broken items yet.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          'Add a new broken item to start the repair.',
                          style: TextStyle(
                            color: subtitleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
