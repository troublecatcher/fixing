import 'package:auto_route/auto_route.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/features/settings/settings_item.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool shareable = true;
    return CupertinoPageScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Settings'),
              previousPageTitle: 'Back',
              border: null,
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Section(
                child: Column(
                  children: [
                    SettingsItem(
                      title: 'Share with friends',
                      onPressed: (ctx) async {
                        if (shareable) {
                          shareable = false;
                          await Share.shareWithResult(
                                  'Check out FixEase on the AppStore!')
                              .whenComplete(() => shareable = true);
                        }
                      },
                    ),
                    SizedBox(height: 8.h),
                    SettingsItem(
                      title: 'Privacy Policy',
                      onPressed: (_) =>
                          context.router.push(const PrivacyPolicyRoute()),
                    ),
                    SizedBox(height: 8.h),
                    SettingsItem(
                      title: 'Terms of Use',
                      onPressed: (_) =>
                          context.router.push(const TermsOfUseRoute()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
