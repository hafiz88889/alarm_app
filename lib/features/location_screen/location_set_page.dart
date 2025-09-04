import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onboarding_task_app/constants/location_controller/location_controller.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_color.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_image.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_text.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_text_style.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/routes.dart';

import '../../common_widgets/custom_eleveted_button/eleveted_button.dart';

class LocationSetPage extends StatelessWidget {
  const LocationSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController=Get.put(LocationController());
    return Scaffold(
      backgroundColor: OnboardingColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                OnboardingText.wellComeText,
                style: onboardingTextStyle18.copyWith(fontSize: 30),
              ),
              const SizedBox(height: 20),
              Text(
                OnboardingText.wellComeTextSubText,
                style: onboardingTextStyle14.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 60),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(OnboardingImage.wellcomeScreenImage),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 25),
              CustomeElevetedButtonWidget(
                color: OnboardingColor.homePageButtonColor,
                text: OnboardingText.useCurrenLoc,
                widget: SvgPicture.asset(OnboardingImage.locationIConONe),
                onPressed: ()async{
                    await locationController.getLocation();
                    Get.toNamed(RouteHelper.homePage);
                  }
              ),
              const SizedBox(height: 8,),
              CustomeElevetedButtonWidget(
                color: OnboardingColor.homePageButtonColor,
                text: OnboardingText.home,
                onPressed: (){
                  Get.toNamed(RouteHelper.homePage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
