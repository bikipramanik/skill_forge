import 'package:equatable/equatable.dart';

class SkillEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final double progress; // 0.0 to 1.0
  final bool isCompleted;

  const SkillEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.progress,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, title, description, category, progress, isCompleted];
}
