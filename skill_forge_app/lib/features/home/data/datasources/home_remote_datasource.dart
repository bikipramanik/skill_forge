import 'package:skill_forge_app/features/home/data/models/skill_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<SkillModel>> fetchSkills();
  Future<SkillModel> fetchSkillById(String id);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  static const List<SkillModel> _mockSkills = [
    SkillModel(
      id: '1',
      title: 'Flutter Architecture & BLoC',
      description: 'Master clean architecture, BLoC pattern, and scalable state management in Flutter.',
      category: 'Mobile Development',
      progress: 0.75,
      isCompleted: false,
    ),
    SkillModel(
      id: '2',
      title: 'Dart Asynchronous Programming',
      description: 'Deep dive into Futures, Streams, Isolates, and Async/Await mechanisms in Dart.',
      category: 'Programming Languages',
      progress: 0.90,
      isCompleted: false,
    ),
    SkillModel(
      id: '3',
      title: 'UI/UX Design Systems',
      description: 'Design responsive, accessible, and high-performance cross-platform design tokens.',
      category: 'Design',
      progress: 0.40,
      isCompleted: false,
    ),
    SkillModel(
      id: '4',
      title: 'RESTful API & GraphQL Integration',
      description: 'Connect Flutter clients to backend APIs securely with efficient caching strategies.',
      category: 'Backend Integration',
      progress: 1.0,
      isCompleted: true,
    ),
  ];

  @override
  Future<List<SkillModel>> fetchSkills() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockSkills;
  }

  @override
  Future<SkillModel> fetchSkillById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockSkills.firstWhere(
      (skill) => skill.id == id,
      orElse: () => throw Exception('Skill not found'),
    );
  }
}
