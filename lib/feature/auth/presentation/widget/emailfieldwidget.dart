import 'package:flutter/material.dart';
import 'package:sa7ty/core/functions/emailvalidat.dart';
import 'package:sa7ty/core/utils/colors.dart';

class emailfieldwidget extends StatelessWidget {
  const emailfieldwidget({
    super.key,
    required this.emailcontroller,
  });

  final TextEditingController emailcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'البريد الالكتروني',
        prefixIcon: Icon(
          Icons.email,
          color: Appcolors.primary,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'البريد الالكتروني مطلوب';
        } else if (!emailValidate(value)) {
          return 'من فضلك ادخل الايميل صحيحا';
        } else {
          return null;
        }
      },
    );
  }
}
