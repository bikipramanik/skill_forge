import 'package:skill_forge_app/features/home/domain/entities/skill_entity.dart';
import 'package:skill_forge_app/features/home/domain/repositories/home_repository.dart';

class GetSkillsUseCase {
  final HomeRepository repository;

  const GetSkillsUseCase(this.repository);

  Future<List<SkillEntity>> call() async {
    return await repository.getSkills();
  }
}
