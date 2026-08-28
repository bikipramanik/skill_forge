import 'package:equatable/equatable.dart';
import 'package:skill_forge_app/features/home/domain/entities/skill_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<SkillEntity> skills;

  const HomeLoaded({required this.skills});

  @override
  List<Object?> get props => [skills];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
