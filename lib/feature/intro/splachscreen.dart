import 'package:flutter/material.dart';
import 'package:sa7ty/core/functions/navigation.dart';
import 'package:sa7ty/core/services/cashing.dart';
import 'package:sa7ty/feature/intro/onboarding/onboardingscreen.dart';
import 'package:sa7ty/feature/intro/welcomscreen.dart';

class Splachscreen extends StatelessWidget {
  const Splachscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      appcashing.getdata(key: appcashing.onBoarding)==true?
      context.pushReplacement(context,Welcomscreen()):
     context.pushReplacement(context,Onboardingscreen());
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Se7tec__1_-removebg-preview 1.png',height: 350,width: 350,),
      ),
    );
  }
}