import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/features/explore/presentation/cubit/category_cubit.dart';
import 'package:skill_forge_app/features/explore/presentation/widgets/category_filter_chips.dart';
import 'package:skill_forge_app/features/explore/presentation/widgets/courses_container.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const List<String> _categories = [
    'All Categories',
    'Development',
    'Design',
    'Business',
    'Marketing',
    'Finance',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/Logo.png", height: height * .2),
          centerTitle: false,
          actions: const [
            Icon(Icons.search),
            SizedBox(width: 10),
            CircleAvatar(),
            SizedBox(width: 10),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search skills, courses...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: const Icon(Icons.tune, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),
            const CategoryFilterChips(categories: _categories),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CoursesContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

