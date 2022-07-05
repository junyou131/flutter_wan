import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/res/language/translation_service.dart';
import 'package:flutter_wan/common/route/app_pages.dart';
import 'package:flutter_wan/common/route/app_routes.dart';
import 'package:flutter_wan/page/application/view.dart';
import 'package:get/get.dart';

import 'common/global/global.dart';
import 'common/res/z_res.dart';

GlobalKey globalKey = GlobalKey();

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Global.init().then((value) => runApp(const MyApp()));
  // await Global.init();
  // runZonedGuarded(() => runApp(const MyApp()), (error, stack) {});
  await Global.init();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          key: globalKey,
          initialRoute: AppRoutes.application,
          getPages: AppPages.pages,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeRes.purpleTheme,
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
        );
      },
      designSize: const Size(375, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ApplicationPage(),
    );
  }
}
