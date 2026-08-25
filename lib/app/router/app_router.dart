import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_forge_app/core/constants/app_constants.dart';
import 'package:skill_forge_app/features/home/domain/entities/skill_entity.dart';
import 'package:skill_forge_app/features/home/presentation/screens/home_screen.dart';
import 'package:skill_forge_app/features/home/presentation/screens/skill_detail_screen.dart';
import 'package:skill_forge_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:skill_forge_app/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.splashRoute,
    routes: [
      GoRoute(
        path: AppConstants.splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppConstants.onboardingRoute,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppConstants.homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppConstants.skillDetailRoute,
        builder: (context, state) {
          final skill = state.extra as SkillEntity;
          return SkillDetailScreen(skill: skill);
        },
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
