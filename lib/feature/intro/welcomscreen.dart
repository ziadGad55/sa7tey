import 'package:flutter/material.dart';
import 'package:sa7ty/core/constant/enum.dart';
import 'package:sa7ty/core/functions/navigation.dart';
import 'package:sa7ty/core/utils/colors.dart';
import 'package:sa7ty/core/utils/fonts.dart';
import 'package:sa7ty/core/widget/custombuttons.dart';
import 'package:sa7ty/feature/auth/presentation/page/login.dart';

class Welcomscreen extends StatelessWidget {
  const Welcomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/welcome-bg.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
              ),
              Text(
                'اهلا بيك',
                style: getheadtyle(size: 45),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'سجل و احجز عند دكتورك و انت في البيت',
                style: getmediamstyle(size: 18),
              ),
              Spacer(
                flex: 6,
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Appcolors.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سجل دلوقتي كـ',
                      style: gettilestyle(size: 23, color: Appcolors.secondary),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    custombuttons(
                      onPressed: () {context.push(context, Login(slectedusertype: usertype.doctor));},
                      text: 'دكتور',
                      width: double.infinity,
                      height: 70,
                      color: Appcolors.secondary.withOpacity(0.8),
                      textstyle: gettilestyle(color: Appcolors.dark, size: 22),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    custombuttons(
                      onPressed: () {context.push(context, Login( slectedusertype: usertype.patient));},
                      text: 'مريض',
                      width: double.infinity,
                      height: 70,
                       color: Appcolors.secondary.withOpacity(0.8),
                      textstyle: gettilestyle(color: Appcolors.dark, size: 22),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
