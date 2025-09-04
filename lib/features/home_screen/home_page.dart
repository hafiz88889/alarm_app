
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onboarding_task_app/common_widgets/custom_eleveted_button/eleveted_button.dart';
import 'package:onboarding_task_app/constants/location_controller/location_controller.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_color.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_image.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_text.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/onboarding_text_style.dart';

import '../../constants/alarm_controller/alarm_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.find();
    final AlarmController alarmController = Get.put(AlarmController());

    Future<void> _pickDateTime(BuildContext context) async {
      DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(minutes: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

      if (date != null) {
        TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (time != null) {
          final selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
          alarmController.addAlarm(selectedDateTime);
        }
      }
    }

    return Scaffold(
      backgroundColor: OnboardingColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Text(OnboardingText.selectedLoc, style: onboardingTextStyle18),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    OnboardingImage.locationIconTwo,
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(width: 10),
                  Obx(
                    () => Text(
                      locationController.currentLocation.value.isEmpty
                          ? OnboardingText.noLocfaced
                          : locationController.currentLocation.value,
                      textAlign: TextAlign.center,
                      style: onboardingTextStyle14.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomeElevetedButtonWidget(
                color: OnboardingColor.homePageButtonColor,
                text: OnboardingText.addAlarm,
                onPressed: () {
                  _pickDateTime(context);
                },
              ),
              const SizedBox(height: 35),
              Text(OnboardingText.alarm, style: onboardingTextStyle18),
              const SizedBox(height: 16,),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: alarmController.alarms.length,
                    itemBuilder: (context, index) {
                      var alarm = alarmController.alarms[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          color: OnboardingColor.homePageButtonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                alarm["time"],
                                  style: onboardingTextStyle18.copyWith(fontSize: 22)
                              ),
                            ),
                            Text(
                              alarm["date"],
                              style: onboardingTextStyle14
                            ),
                            const SizedBox(width: 5,),
                            // Switch
                            Switch(
                              activeColor: OnboardingColor.whiteColor,
                              activeTrackColor: OnboardingColor.primaryColor,
                              value: alarm["enabled"],
                              onChanged:(value) {
                                alarmController.toggleAlarm(index,value);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
