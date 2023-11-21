import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/core/routing/app_router.dart';
import 'package:health_care/core/themes/colors.dart';
import 'package:intl/intl.dart';

import 'core/routing/routes.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class DocApp extends StatelessWidget {
  const DocApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doc Doc App',
        locale: Locale(Intl.getCurrentLocale()),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: ColorsManager.white,
          useMaterial3: true,
        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
