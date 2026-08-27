import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/app/theme/app_colors.dart';
import 'package:skill_forge_app/features/learning/domain/models/learning_course.dart';
import 'package:skill_forge_app/features/learning/presentation/cubit/learning_cubit.dart';
import 'package:skill_forge_app/features/learning/presentation/widgets/completed_course_card.dart';
import 'package:skill_forge_app/features/learning/presentation/widgets/learning_course_card.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});

  static const List<LearningCourse> _ongoingCourses = [
    LearningCourse(
      id: '1',
      title: 'Advanced Flutter & BLoC Architecture',
      category: 'Mobile Dev',
      imagePath: 'assets/images/flutter_bloc_course.jpg',
      lastAccessed: '2 hours ago',
      completedLessons: 12,
      totalLessons: 18,
      progressPercent: 0.65,
      status: CourseStatus.inProgress,
    ),
    LearningCourse(
      id: '2',
      title: 'Machine Learning Foundations',
      category: 'Data Science',
      imagePath: 'assets/images/ml_foundations_course.jpg',
      lastAccessed: 'Yesterday',
      completedLessons: 4,
      totalLessons: 24,
      progressPercent: 0.15,
      status: CourseStatus.inProgress,
    ),
    LearningCourse(
      id: '3',
      title: 'UI/UX Systems Design',
      category: 'Design',
      imagePath: 'assets/images/ui_ux_design_course.jpg',
      lastAccessed: '3 days ago',
      completedLessons: 28,
      totalLessons: 30,
      progressPercent: 0.92,
      status: CourseStatus.inProgress,
    ),
  ];

  static const List<LearningCourse> _completedCourses = [
    LearningCourse(
      id: '101',
      title: 'Full-Stack Dart & Flutter Masterclass',
      category: 'Mobile Dev',
      imagePath: 'assets/images/flutter_bloc_course.jpg',
      lastAccessed: 'Completed',
      completedLessons: 36,
      totalLessons: 36,
      progressPercent: 1.0,
      status: CourseStatus.completed,
      isCompleted: true,
      completedDate: 'Aug 15, 2026',
    ),
    LearningCourse(
      id: '102',
      title: 'UI/UX Wireframing & Prototyping Essentials',
      category: 'Design',
      imagePath: 'assets/images/ui_ux_design_course.jpg',
      lastAccessed: 'Completed',
      completedLessons: 20,
      totalLessons: 20,
      progressPercent: 1.0,
      status: CourseStatus.completed,
      isCompleted: true,
      completedDate: 'Jul 28, 2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LearningCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Row(
            children: [
              Text(
                'SkillForge',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black87),
            ),
            const SizedBox(width: 4),
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFE2E8F0),
              child: Icon(Icons.person, color: Colors.black54, size: 20),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Header Title & Subtitle
              const Text(
                'My Learning',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Continue where you left off or review completed courses.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),

              // Segmented Tab Selector (Ongoing / Completed)
              BlocBuilder<LearningCubit, LearningState>(
                builder: (context, state) {
                  return Container(
                    height: 48,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 231, 255),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context
                                .read<LearningCubit>()
                                .selectTab(LearningTab.ongoing),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: state.selectedTab == LearningTab.ongoing
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow:
                                    state.selectedTab == LearningTab.ongoing
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.06,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Center(
                                child: Text(
                                  'Ongoing',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        state.selectedTab == LearningTab.ongoing
                                        ? AppColors.primary
                                        : Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context
                                .read<LearningCubit>()
                                .selectTab(LearningTab.completed),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color:
                                    state.selectedTab == LearningTab.completed
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow:
                                    state.selectedTab == LearningTab.completed
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.06,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Center(
                                child: Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        state.selectedTab ==
                                            LearningTab.completed
                                        ? AppColors.primary
                                        : Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Course List per Tab
              BlocBuilder<LearningCubit, LearningState>(
                builder: (context, state) {
                  if (state.selectedTab == LearningTab.completed) {
                    if (_completedCourses.isEmpty) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'No completed courses yet',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Keep learning to finish your ongoing courses!',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Column(
                      children: _completedCourses.map((course) {
                        return CompletedCourseCard(
                          course: course,
                          onViewCertificatePressed: () {
                            // Action for View Certificate
                          },
                          onReviewPressed: () {
                            // Action for Review Course
                          },
                        );
                      }).toList(),
                    );
                  }

                  return Column(
                    children: _ongoingCourses.map((course) {
                      return LearningCourseCard(
                        course: course,
                        onResumePressed: () {
                          // Action when user taps Resume Learning
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
