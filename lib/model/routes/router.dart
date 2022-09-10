import 'package:get/get.dart';
import 'package:resala/views/screen/auth/auth_screen.dart';
import 'package:resala/views/screen/auth/forget_pass_screen.dart';
import 'package:resala/views/screen/home/home_screen.dart';
import 'package:resala/views/screen/landing_screen.dart';
import 'package:resala/views/screen/splash/splash_screen.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String forgetPassword = '/forgetPassword';
  static const String landingPage = '/landing';
  static const String home = '/home';

  static String getSplash() => splash;
  static String getAuth() => auth;
  static String getForgetPassword() => forgetPassword;
  static String getinitial() => landingPage;
  static String getHome() => home;

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () {
        return const SplashScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: landingPage,
      page: () {
        return const LandingPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: home,
      page: () {
        return const HomeScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: auth,
      page: () {
        return const AuthScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: forgetPassword,
      page: () {
        return const ForgetPasswordScreen();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
