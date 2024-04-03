import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/widget/custom_button.dart';
import 'package:fixease/custom/widget/custom_text_button.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';

@RoutePage()
class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              Section(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: borderRadius,
                      child: Image.asset(
                        'assets/images/onboarding.png',
                        color: accentColor,
                        colorBlendMode: BlendMode.colorBurn,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Welcome to FixEase',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Simplify the process of conducting technical maintenance and repair of various objects with the help of our application.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: subtitleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Section(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        title: 'Get started',
                        onPressed: () =>
                            context.router.replace(const DetailsRoute()),
                        isActive: true,
                        color: secondaryColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextButton(
                            title: 'Terms of Use',
                            onPressed: () =>
                                context.router.push(const TermsOfUseRoute()),
                            color: linksColor,
                          ),
                          const Text(
                            ' / ',
                            style: TextStyle(color: linksColor),
                          ),
                          CustomTextButton(
                            title: 'Privacy Policy',
                            onPressed: () =>
                                context.router.push(const PrivacyPolicyRoute()),
                            color: linksColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
