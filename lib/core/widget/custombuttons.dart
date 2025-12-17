import 'package:flutter/material.dart';

import 'package:sa7ty/core/utils/colors.dart';
import 'package:sa7ty/core/utils/fonts.dart';

class custombuttons extends StatelessWidget {
  const custombuttons({
    super.key,
    this.color,
    required this.onPressed,
    this.width,
    this.height,
    required this.text,
    this.textstyle,
  });
  final String text;
  final Color? color;
  final Function() onPressed;
  final double? width;
  final double? height;
  final TextStyle? textstyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250,
      height: height ?? 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Appcolors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Text(
            text,
            style: textstyle ?? getsmallstyle(color: Appcolors.white),
          )),
    );
  }
}
