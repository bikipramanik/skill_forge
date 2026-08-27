part of 'learning_cubit.dart';

enum LearningTab { ongoing, completed }

class LearningState {
  final LearningTab selectedTab;
  const LearningState({this.selectedTab = LearningTab.ongoing});

  LearningState copyWith({LearningTab? selectedTab}) {
    return LearningState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
