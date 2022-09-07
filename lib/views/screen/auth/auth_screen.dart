import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/screen/auth/login_screen.dart';
import 'package:resala/views/screen/auth/register_screen.dart';

import '../../widget/colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> tabs = <Tab>[
    const Tab(text: "تسجيل الدخول"),
    const Tab(text: "مستخدم جديد"),
  ];

  List<Widget> widgets = <Widget>[
    const LoginScreen(),
    const RegisterScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widgets.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: Get.context!.height * 0.08,
          ),
          SizedBox(
            height: Get.context!.height * 0.2,
            width: Get.context!.height * 0.2,
            child: const Center(
              child: Image(
                image: AssetImage('assets/img/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          TabBar(
            indicatorColor: AppColors.mainBlueColor,
            labelColor: AppColors.mainRedColor,
            labelStyle: const TextStyle(fontSize: 18),
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            tabs: tabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widgets,
            ),
          ),
        ],
      ),
    );
  }
}
