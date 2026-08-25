import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  void nextPage() {
    state.currentPage < 2
        ? emit(OnboardingState(currentPage: state.currentPage + 1))
        : emit(OnboardingState(isCompleted: true));
  }

  void prevPage() {
    if (state.currentPage > 0) {
      emit(OnboardingState(currentPage: state.currentPage - 1));
    }
  }
}
