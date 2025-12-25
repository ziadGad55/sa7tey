import 'package:flutter/material.dart';
import 'package:sa7ty/core/constant/enum.dart';
import 'package:sa7ty/core/functions/navigation.dart';
import 'package:sa7ty/core/utils/colors.dart';
import 'package:sa7ty/core/utils/fonts.dart';
import 'package:sa7ty/core/widget/custombuttons.dart';
import 'package:sa7ty/feature/auth/presentation/page/register.dart';
import 'package:sa7ty/feature/auth/presentation/widget/emailfieldwidget.dart';
import 'package:sa7ty/feature/auth/presentation/widget/passfieldwidget.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.slectedusertype});
  final usertype slectedusertype;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  bool isObscure = true;
  String usertypehandl() {
    return widget.slectedusertype == usertype.doctor ? 'طبيب' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/Se7tec__1_-removebg-preview 1.png',
                    width: 230,
                    height: 230,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'سجل دخول كـ ${usertypehandl()}',
                    style: gettilestyle(size: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  emailfieldwidget(emailcontroller: emailcontroller),
                  SizedBox(
                    height: 20,
                  ),
                  passfieldwidget(
                    passwordcontroller: passwordcontroller,
                    isObscure: isObscure,
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style:
                              getsmallstyle(size: 16, color: Appcolors.primary),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  custombuttons(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        context.pushReplacement(context, widget);
                      }
                    },
                    text: 'تسجيل الدخول',
                    width: double.infinity,
                    height: 60,
                    color: Appcolors.primary,
                    textstyle: gettilestyle(color: Appcolors.white, size: 20),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لديك حساب؟',
                        style: getsmallstyle(size: 16, color: Appcolors.dark),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushReplacement(
                              context,
                              register(
                                  slectedusertype2: widget.slectedusertype));
                        },
                        child: Text(
                          'انشاء حساب',
                          style:
                              getsmallstyle(size: 16, color: Appcolors.primary),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
