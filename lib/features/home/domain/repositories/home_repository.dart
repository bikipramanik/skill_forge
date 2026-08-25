import 'package:skill_forge_app/features/home/domain/entities/skill_entity.dart';

abstract class HomeRepository {
  Future<List<SkillEntity>> getSkills();
  Future<SkillEntity> getSkillById(String id);
}
