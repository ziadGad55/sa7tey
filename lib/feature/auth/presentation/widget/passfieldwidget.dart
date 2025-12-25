import 'package:flutter/material.dart';
import 'package:sa7ty/core/utils/colors.dart';

class passfieldwidget extends StatefulWidget {
  const passfieldwidget({
    super.key,
    required this.passwordcontroller,
    required this.isObscure, this.onPressed,
  });

  final TextEditingController passwordcontroller;
  final bool isObscure;
  final Function()? onPressed;

  @override
  State<passfieldwidget> createState() => _passfieldwidgetState();
}

class _passfieldwidgetState extends State<passfieldwidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.passwordcontroller,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
            hintText: 'كلمة المرور',
            prefixIcon: Icon(
              Icons.lock,
              color: Appcolors.primary,
            ),
            suffixIcon: IconButton(
                onPressed: widget.onPressed,
                icon: widget.isObscure
                    ? Icon(
                        Icons.visibility_off,
                        color: Appcolors.primary,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Appcolors.primary,
                      ))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'كلمة المرور مطلوبة';
          } else if (value.length < 6) {
            return 'كلمة المرور يجب ان تكون اكثر من 6 حروف';
          } else {
            return null;
          }
        });
  }
}
