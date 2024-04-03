// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllItemsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllItemsScreen(),
      );
    },
    DetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DetailsScreen(),
      );
    },
    HelloRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelloScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NewItemFirstRoute.name: (routeData) {
      final args = routeData.argsAs<NewItemFirstRouteArgs>(
          orElse: () => const NewItemFirstRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: NewItemFirstScreen(
          key: args.key,
          index: args.index,
        )),
      );
    },
    NewItemSecondRoute.name: (routeData) {
      final args = routeData.argsAs<NewItemSecondRouteArgs>(
          orElse: () => const NewItemSecondRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: NewItemSecondScreen(
          key: args.key,
          index: args.index,
        )),
      );
    },
    NewItemThirdRoute.name: (routeData) {
      final args = routeData.argsAs<NewItemThirdRouteArgs>(
          orElse: () => const NewItemThirdRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: NewItemThirdScreen(
          key: args.key,
          index: args.index,
        )),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SingleItemRoute.name: (routeData) {
      final args = routeData.argsAs<SingleItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleItemScreen(
          key: args.key,
          index: args.index,
        ),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [AllItemsScreen]
class AllItemsRoute extends PageRouteInfo<void> {
  const AllItemsRoute({List<PageRouteInfo>? children})
      : super(
          AllItemsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllItemsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailsScreen]
class DetailsRoute extends PageRouteInfo<void> {
  const DetailsRoute({List<PageRouteInfo>? children})
      : super(
          DetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelloScreen]
class HelloRoute extends PageRouteInfo<void> {
  const HelloRoute({List<PageRouteInfo>? children})
      : super(
          HelloRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelloRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewItemFirstScreen]
class NewItemFirstRoute extends PageRouteInfo<NewItemFirstRouteArgs> {
  NewItemFirstRoute({
    Key? key,
    int? index,
    List<PageRouteInfo>? children,
  }) : super(
          NewItemFirstRoute.name,
          args: NewItemFirstRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'NewItemFirstRoute';

  static const PageInfo<NewItemFirstRouteArgs> page =
      PageInfo<NewItemFirstRouteArgs>(name);
}

class NewItemFirstRouteArgs {
  const NewItemFirstRouteArgs({
    this.key,
    this.index,
  });

  final Key? key;

  final int? index;

  @override
  String toString() {
    return 'NewItemFirstRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [NewItemSecondScreen]
class NewItemSecondRoute extends PageRouteInfo<NewItemSecondRouteArgs> {
  NewItemSecondRoute({
    Key? key,
    int? index,
    List<PageRouteInfo>? children,
  }) : super(
          NewItemSecondRoute.name,
          args: NewItemSecondRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'NewItemSecondRoute';

  static const PageInfo<NewItemSecondRouteArgs> page =
      PageInfo<NewItemSecondRouteArgs>(name);
}

class NewItemSecondRouteArgs {
  const NewItemSecondRouteArgs({
    this.key,
    this.index,
  });

  final Key? key;

  final int? index;

  @override
  String toString() {
    return 'NewItemSecondRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [NewItemThirdScreen]
class NewItemThirdRoute extends PageRouteInfo<NewItemThirdRouteArgs> {
  NewItemThirdRoute({
    Key? key,
    int? index,
    List<PageRouteInfo>? children,
  }) : super(
          NewItemThirdRoute.name,
          args: NewItemThirdRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'NewItemThirdRoute';

  static const PageInfo<NewItemThirdRouteArgs> page =
      PageInfo<NewItemThirdRouteArgs>(name);
}

class NewItemThirdRouteArgs {
  const NewItemThirdRouteArgs({
    this.key,
    this.index,
  });

  final Key? key;

  final int? index;

  @override
  String toString() {
    return 'NewItemThirdRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleItemScreen]
class SingleItemRoute extends PageRouteInfo<SingleItemRouteArgs> {
  SingleItemRoute({
    Key? key,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          SingleItemRoute.name,
          args: SingleItemRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleItemRoute';

  static const PageInfo<SingleItemRouteArgs> page =
      PageInfo<SingleItemRouteArgs>(name);
}

class SingleItemRouteArgs {
  const SingleItemRouteArgs({
    this.key,
    required this.index,
  });

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'SingleItemRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
