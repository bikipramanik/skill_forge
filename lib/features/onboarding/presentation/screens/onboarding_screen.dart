import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_forge_app/core/constants/app_constants.dart';
import 'package:skill_forge_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:skill_forge_app/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state.isCompleted) {
            context.go(AppConstants.homeRoute);
          }
        },
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final cubit = context.read<OnboardingCubit>();
            return Scaffold(
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Container(
                      height: 200,
                      width: 200,
                      color: state.currentPage == 0
                          ? Colors.red
                          : state.currentPage == 1
                          ? Colors.green
                          : Colors.blue,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (state.currentPage > 0)
                            ElevatedButton(
                              onPressed: cubit.prevPage,
                              child: const Text("Previous"),
                            )
                          else
                            const SizedBox.shrink(),
                          ElevatedButton(
                            onPressed: cubit.nextPage,
                            child: Text(
                              state.currentPage < 2 ? "Next" : "Get Started",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
