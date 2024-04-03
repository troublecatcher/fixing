import 'package:auto_route/auto_route.dart';
import 'package:fixease/features/main/all_items_screen.dart';
import 'package:fixease/features/main/single_item_screen.dart';
import 'package:fixease/features/new_item/new_item_first_screen.dart';
import 'package:fixease/features/new_item/new_item_second_screen.dart';
import 'package:fixease/features/new_item/new_item_third_screen.dart';
import 'package:fixease/features/onboarding/details_screen.dart';
import 'package:fixease/features/settings/privacy_policy_screen.dart';
import 'package:fixease/features/settings/promotion_screen.dart';
import 'package:fixease/features/settings/settings_screen.dart';
import 'package:fixease/features/settings/terms_of_use_screen.dart';
import 'package:fixease/main.dart';
import 'package:fixease/features/main/main_screen.dart';
import 'package:flutter/cupertino.dart';

import '../features/onboarding/hello_screen.dart';

part 'router.gr.dart';

final showPromotion = promotion != null && promotion != '';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: HelloRoute.page, initial: isFirstTime! && !showPromotion),
        AutoRoute(page: DetailsRoute.page),
        AutoRoute(
            page: MainRoute.page, initial: !isFirstTime! && !showPromotion),
        AutoRoute(page: AllItemsRoute.page),
        AutoRoute(page: SingleItemRoute.page),
        AutoRoute(page: NewItemFirstRoute.page),
        AutoRoute(page: NewItemSecondRoute.page),
        AutoRoute(page: NewItemThirdRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: PromotionRoute.page, initial: showPromotion),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
      ];
}
