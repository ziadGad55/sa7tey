import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sa7ty/core/functions/navigation.dart';
import 'package:sa7ty/core/services/cashing.dart';
import 'package:sa7ty/core/utils/colors.dart';
import 'package:sa7ty/core/utils/fonts.dart';
import 'package:sa7ty/core/widget/custombuttons.dart';
import 'package:sa7ty/feature/intro/onboarding/onboardingmodel.dart';
import 'package:sa7ty/feature/intro/welcomscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              appcashing.cashdata(key: appcashing.onBoarding, value: true);
              context.pushReplacement(context, Welcomscreen());
            },
            child: Text(
              'تخطي',
              style: getmediamstyle(color: Appcolors.primary),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentindex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Spacer(),
                      SvgPicture.asset(
                        pages[index].image,
                        height: 350,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      Spacer(),
                      Text(pages[index].title, style: gettilestyle()),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        pages[index].body,
                        style: getmediamstyle(),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(
                        flex: 4,
                      ),
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: pageController,
                              count: pages.length,
                              effect: WormEffect(
                                dotColor: Appcolors.grey,
                                activeDotColor: Appcolors.primary,
                                dotHeight: 8,
                                dotWidth: 16,
                                spacing: 8,
                              ),
                            ),
                            if (pages.length - 1 == currentindex)
                              custombuttons(
                                onPressed: () {
                                  appcashing.cashdata(
                                      key: appcashing.onBoarding, value: true);
                                  context.pushReplacement(
                                      context, Welcomscreen());
                                },
                                text: 'هيا بنا',
                                height: 50,
                                width: 100,
                              ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
