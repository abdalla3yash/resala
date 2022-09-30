import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/controller/controllers/home_controller.dart';
import 'package:resala/views/screen/profile/profile_screen.dart';
import 'base/dep.dart' as dep;
import 'model/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool userLogged = Get.find<AuthController>().userLoggedIn();

    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      locale: const Locale('ar', 'AE'),
      title: 'Resala',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "NotoSansArabic",
      ),
      initialRoute:
          userLogged ? RouteHelper.getinitial() : RouteHelper.getSplash(),
      getPages: RouteHelper.routes,
    );
  }
}
