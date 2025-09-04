import 'package:flutter/material.dart';

import '../../helpers/helper_utilities/onboarding_color.dart';
import '../../helpers/helper_utilities/onboarding_text.dart';
import '../../helpers/helper_utilities/onboarding_text_style.dart';

class CustomeElevetedButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final Widget? widget;
  final VoidCallback onPressed;

  const CustomeElevetedButtonWidget({
    super.key,
    required this.color,
    required this.text,
    this.widget,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(double.infinity, 55),
      ),
      onPressed:onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: onboardingTextStyle14.copyWith(fontSize: 16)),
          const SizedBox(width: 8),
          if (widget != null) widget!,
        ],
      ),
    );
  }
}
