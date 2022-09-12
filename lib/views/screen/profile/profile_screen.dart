import 'package:flutter/material.dart';
import 'package:resala/views/widget/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainRedColor,
        title: const Text(
          "رساله",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.whiteColor,
      body: const Center(
        child: Text("الصفحه الشخصيه تحت الانشاء"),
      ),
    );
  }
}
