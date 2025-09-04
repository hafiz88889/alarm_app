import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_color.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helpers/helper_utilities/onboarding_text.dart';
import '../../helpers/helper_utilities/onboarding_text_style.dart';
import '../../helpers/helper_utilities/routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.toNamed(RouteHelper.locationSetPage);
    }
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final List<Map<String, String>> onboardingData = [
      {
        'title': OnboardingText.title1,
        'subtitle': OnboardingText.subtitle1,
        'image': OnboardingImage.onboardingOne,
      },
      {
        'title': OnboardingText.title2,
        'subtitle': OnboardingText.subtitle2,
        'image': OnboardingImage.onboardingTwo,
      },
      {
        'title': OnboardingText.title3,
        'subtitle': OnboardingText.subtitle3,
        'image': OnboardingImage.onboardingThree,
      },
    ];
    return Scaffold(
      backgroundColor: OnboardingColor.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final item = onboardingData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 40,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.locationSetPage);
                            },
                            child: Text(
                              OnboardingText.skip,
                              style: onboardingTextStyle18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Text(
                      item['title']!,
                      style: onboardingTextStyle18.copyWith(fontSize: 34),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      item['subtitle']!,
                      textAlign: TextAlign.start,
                      style: onboardingTextStyle14,
                    ),
                    const SizedBox(height: 30,),
                  ],
                );
              },
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: 3,
              effect: JumpingDotEffect(
                activeDotColor: OnboardingColor.primaryColor,
                dotColor: OnboardingColor.homePageButtonColor,
                dotHeight: 10,
                dotWidth: 10,
                jumpScale: 3,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ElevatedButton(
              onPressed: controller.nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: OnboardingColor.primaryColor,
                minimumSize: Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Obx(
                    () => Text(
                  controller.currentPage.value < 2 ? 'Next' :"Next",
                  style: onboardingTextStyle18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
