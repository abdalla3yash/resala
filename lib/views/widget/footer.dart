import 'package:flutter/material.dart';
import 'package:resala/views/widget/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "نرحب بتواصلكم معنا",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "19450",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.phone,
              size: 14,
              color: AppColors.mainBlueColor,
            ),
            const SizedBox(
              width: 5,
            ),
            const VerticalDivider(),
            const SizedBox(
              width: 5,
            ),
            Text(
              "contact_us@resala.org",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.mail,
              size: 14,
              color: AppColors.mainRedColor,
            ),
          ],
        )
      ],
    );
  }
}
