import 'package:skill_forge_app/features/home/domain/entities/skill_entity.dart';

class SkillModel extends SkillEntity {
  const SkillModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.progress,
    required super.isCompleted,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      progress: (json['progress'] as num).toDouble(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'progress': progress,
      'isCompleted': isCompleted,
    };
  }
}
