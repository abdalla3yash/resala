import 'package:flutter/material.dart';
import 'package:resala/views/widget/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainRedColor,
        title: Text(
          "رساله",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Text("الصفحه تحت الانشاء"),
      ),
    );
  }
}