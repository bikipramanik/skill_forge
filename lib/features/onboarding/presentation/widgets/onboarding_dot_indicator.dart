import 'package:flutter/material.dart';
import 'package:skill_forge_app/app/theme/app_colors.dart';

class OnboardingDotIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const OnboardingDotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          final isSelected = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 8.0,
            width: isSelected ? 24.0 : 8.0,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4.0),
            ),
          );
        },
      ),
    );
  }
}
