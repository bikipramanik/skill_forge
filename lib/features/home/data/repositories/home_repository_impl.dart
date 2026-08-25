import 'package:skill_forge_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:skill_forge_app/features/home/domain/entities/skill_entity.dart';
import 'package:skill_forge_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  const HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SkillEntity>> getSkills() async {
    return await remoteDataSource.fetchSkills();
  }

  @override
  Future<SkillEntity> getSkillById(String id) async {
    return await remoteDataSource.fetchSkillById(id);
  }
}
