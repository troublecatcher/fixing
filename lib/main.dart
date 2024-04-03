import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/new_item/bloc/item_bloc.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:fixease/init/init_hive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:fixease/init/init_di.dart';
import 'package:fixease/init/init_firebase.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool? isFirstTime;
String? privacyPolicy;
String? termsOfUse;
String? promotion;
Box<Item>? itemBox;

final locator = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initDI();
  await initHive();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemListCubit(),
        ),
        BlocProvider(
          create: (context) => ItemBloc(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return CupertinoApp.router(
          theme: theme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
