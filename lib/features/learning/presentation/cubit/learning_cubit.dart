import 'package:flutter_bloc/flutter_bloc.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  LearningCubit() : super(const LearningState());

  void selectTab(LearningTab tab) {
    if (state.selectedTab != tab) {
      emit(state.copyWith(selectedTab: tab));
    }
  }
}
