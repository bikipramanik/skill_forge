import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadSkillsEvent extends HomeEvent {
  const LoadSkillsEvent();
}

class RefreshSkillsEvent extends HomeEvent {
  const RefreshSkillsEvent();
}
