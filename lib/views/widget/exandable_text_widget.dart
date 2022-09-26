import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

class ExandableTextWidget extends StatefulWidget {
  final String text;
  const ExandableTextWidget({super.key, required this.text});

  @override
  State<ExandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Get.context!.height * 0.5;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: const TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 16,
              ),
            )
          : Column(
              children: [
                Text(
                  hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                  style: const TextStyle(
                    color: AppColors.hintTextColor,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddenText ? "Show more" : "Show less",
                        style: const TextStyle(
                          color: AppColors.mainBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: AppColors.mainBlueColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
