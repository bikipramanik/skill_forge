import 'package:flutter/material.dart';
import 'package:skill_forge_app/core/widgets/profile_avatar_menu.dart';
import 'package:skill_forge_app/features/wishlist/domain/models/wishlist_course.dart';
import 'package:skill_forge_app/features/wishlist/presentation/widgets/wishlist_course_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  static const List<WishlistCourse> _wishlistedCourses = [
    WishlistCourse(
      id: 'w1',
      title: 'Advanced React Patterns & Performance',
      instructor: 'Sarah Drasner',
      category: 'Web Dev',
      imagePath: 'assets/images/react_course.jpg',
      rating: 4.9,
      reviewCount: '1.2k',
      price: 89.99,
    ),
    WishlistCourse(
      id: 'w2',
      title: 'UX/UI Masterclass: From Wireframe to Prototype',
      instructor: 'Gary Simon',
      category: 'Design',
      imagePath: 'assets/images/ui_ux_design_course.jpg',
      rating: 4.8,
      reviewCount: '850',
      price: 129.99,
    ),
    WishlistCourse(
      id: 'w3',
      title: 'Data Structures & Algorithms in Python',
      instructor: 'Andrei Neagoie',
      category: 'Computer Science',
      imagePath: 'assets/images/dsa_python_course.jpg',
      rating: 4.9,
      reviewCount: '3.4k',
      price: 99.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Image.asset("assets/Logo.png", height: 150),
        centerTitle: false,
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 8),
          ProfileAvatarMenu(),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Screen Header Title & Subtitle
            const Text(
              'Wishlist',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Courses you've saved for later.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.3,
              ),
            ),
            const SizedBox(height: 24),

            // Wishlist Cards List
            Column(
              children: _wishlistedCourses.map((course) {
                return WishlistCourseCard(
                  course: course,
                  onBuyNow: () {
                    // Action when user taps Add to Cart
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
