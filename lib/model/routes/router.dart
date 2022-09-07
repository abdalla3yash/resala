import 'package:get/get.dart';
import 'package:resala/views/screen/auth/auth_screen.dart';
import 'package:resala/views/screen/auth/forget_pass_screen.dart';
import 'package:resala/views/screen/home/home_screen.dart';

class RouteHelper {
  static const String home = '/home';
  static const String auth = '/auth';
  static const String forgetPassword = '/forgetPassword';

  static String getHome() => home;
  static String getAuth() => auth;

  static String getForgetPassword() => forgetPassword;

  static List<GetPage> routes = [
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
