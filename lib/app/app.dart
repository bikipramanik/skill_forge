import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/app/router/app_router.dart';
import 'package:skill_forge_app/app/theme/app_theme.dart';
import 'package:skill_forge_app/core/constants/app_constants.dart';
import 'package:skill_forge_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:skill_forge_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:skill_forge_app/features/home/domain/usecases/get_skills_usecase.dart';
import 'package:skill_forge_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:skill_forge_app/features/home/presentation/bloc/home_event.dart';

class SkillForgeApp extends StatelessWidget {
  const SkillForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Basic Service / Repository wiring (can be swapped with get_it / Injectable if needed)
    final remoteDataSource = HomeRemoteDataSourceImpl();
    final repository = HomeRepositoryImpl(remoteDataSource: remoteDataSource);
    final getSkillsUseCase = GetSkillsUseCase(repository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(getSkillsUseCase: getSkillsUseCase)
            ..add(const LoadSkillsEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
