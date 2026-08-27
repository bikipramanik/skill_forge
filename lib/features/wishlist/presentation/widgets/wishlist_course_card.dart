import 'package:flutter/material.dart';
import 'package:skill_forge_app/app/theme/app_colors.dart';
import 'package:skill_forge_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:skill_forge_app/features/wishlist/domain/models/wishlist_course.dart';

class WishlistCourseCard extends StatelessWidget {
  final WishlistCourse course;
  final VoidCallback? onBuyNow;

  const WishlistCourseCard({super.key, required this.course, this.onBuyNow});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail Stack with Wishlist Icon and Category Tag
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  course.imagePath,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 190,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.school, size: 48, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),

              // Favorite Heart Icon Button (Top Right)
              Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white.withValues(alpha: 0.92),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),

              // Category Badge Pill (Bottom Left of Thumbnail)
              Positioned(
                left: 14,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBE8FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    course.category,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Course Information Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),

                // Instructor
                Text(
                  course.instructor,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 14),

                // Rating & Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star_outline_rounded,
                          size: 18,
                          color: Color(0xFFB45309),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${course.rating}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${course.reviewCount})',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                    // Price
                    Text(
                      '\$${course.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed:
                        onBuyNow ??
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                courseTitle: course.title,
                                category: course.category,
                                imagePath: course.imagePath,
                                instructor: course.instructor,
                                price: course.price,
                              ),
                            ),
                          );
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
