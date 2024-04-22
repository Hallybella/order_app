import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:order_app/app/app.router.dart';
import 'package:order_app/shared/app_theme.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => child!,
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.authScreen,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          // theme: Provider.of<ThemeProvider>(context).themeData,
          theme: lightMode,
          darkTheme: darkMode,
        ),
      ),
    );
  }
}
