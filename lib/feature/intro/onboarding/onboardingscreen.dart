import 'package:flutter/material.dart';
import 'package:sa7ty/core/functions/navigation.dart';
import 'package:sa7ty/core/utils/colors.dart';
import 'package:sa7ty/core/utils/fonts.dart';
import 'package:sa7ty/feature/intro/onboarding/onboardingmodel.dart';
import 'package:sa7ty/feature/intro/welcomscreen.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  int currentindex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              context.pushReplacement(context, Welcomscreen());
            },
            child: const Text(
              'تخطي',
              style: TextStyle(color: Appcolors.primary),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              controller: pageController,
               onPageChanged: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      pages[index].image,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      pages[index].title,
                      style: gettilestyle()
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      pages[index].body,
                      style: getmediamstyle(),
                    ),
                  ],
                );
              },
              

             
            ),
          ),
        ],
      ),
    );
  }
}
