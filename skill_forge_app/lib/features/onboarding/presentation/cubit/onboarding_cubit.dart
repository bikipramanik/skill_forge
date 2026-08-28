import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  /// Called when the user manually swipes or PageController finishes animating.
  void onPageChanged(int index) {
    if (index >= 0 && index < state.items.length) {
      emit(state.copyWith(currentPage: index));
    }
  }

  /// Marks onboarding as complete.
  void skip() {
    completeOnboarding();
  }

  /// Marks onboarding as complete.
  void completeOnboarding() {
    emit(state.copyWith(isCompleted: true));
  }
}
