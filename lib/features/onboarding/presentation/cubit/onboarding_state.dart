import 'package:equatable/equatable.dart';
import 'package:skill_forge_app/features/onboarding/domain/models/onboarding_item.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final bool isCompleted;
  final List<OnboardingItem> items;

  OnboardingState({
    this.currentPage = 0,
    this.isCompleted = false,
    List<OnboardingItem>? items,
  }) : items = items ?? OnboardingItem.items;

  bool get isLastPage => currentPage == items.length - 1;

  OnboardingState copyWith({
    int? currentPage,
    bool? isCompleted,
    List<OnboardingItem>? items,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isCompleted: isCompleted ?? this.isCompleted,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [currentPage, isCompleted, items];
}
