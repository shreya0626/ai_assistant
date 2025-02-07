import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/widget/custom_btn.dart';
import 'package:ai_assistant/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();


    final list = [
      // onboarding 1
      Onboard(
        title: 'Ask me Anything',
        subtitle:
            'I can be your Best Friend & You can ask me anything & I will help you!',
        lottie: 'ai_ask_me',
      ),

      // onboarding 2
      Onboard(
        title: 'Imagination to Reality',
        subtitle:
            'Just Imagine anything & let me know, I will create something wonderful for you!',
        lottie: 'ai_play',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;
          return Column(
            children: [
              // Lottie animation
              Lottie.asset(
                'assets/lottie/${list[ind].lottie}.json',
                height: mq.height * .6, width: isLast ? mq.width * .7 : null
              ),

              // Title
              Text(
                list[ind].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .5,
                ),
              ),

              // For adding space
              SizedBox(height: mq.height * .015),

              // Subtitle
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.5,
                    letterSpacing: .5,
                    color: Theme.of(context).lightTextColor,
                  ),
                ),
              ),
              const Spacer(),

              // Dots indicator
              Wrap(
                spacing: 10,
                children: List.generate(
                  2,
                  (i) => Container(
                    width: i == ind ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == ind ? Colors.blue : Colors.grey,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              const Spacer(),

              // Button
              CustomBtn(onTap: () {
                  if(isLast){
                    Get.off(() => const HomeScreen());
                   /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => const HomeScreen()));
 */
                  } else {
                    c.nextPage(
                        duration: const Duration(milliseconds: 600), 
                        curve: Curves.ease);
                  }
                
              }, text: isLast ? 'Finish' : 'Next'),
              
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
