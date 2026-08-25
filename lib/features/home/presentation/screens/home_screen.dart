import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_forge_app/core/constants/app_constants.dart';
import 'package:skill_forge_app/core/widgets/loading_indicator.dart';
import 'package:skill_forge_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:skill_forge_app/features/home/presentation/bloc/home_event.dart';
import 'package:skill_forge_app/features/home/presentation/bloc/home_state.dart';
import 'package:skill_forge_app/features/home/presentation/widgets/skill_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<HomeBloc>().add(const RefreshSkillsEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const LoadingIndicator(message: 'Forging your skills...');
          }

          if (state is HomeError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(const LoadSkillsEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is HomeLoaded) {
            if (state.skills.isEmpty) {
              return const Center(
                child: Text('No skills tracked yet.'),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(const RefreshSkillsEvent());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.skills.length,
                itemBuilder: (context, index) {
                  final skill = state.skills[index];
                  return SkillCard(
                    skill: skill,
                    onTap: () {
                      context.push(
                        AppConstants.skillDetailRoute,
                        extra: skill,
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
