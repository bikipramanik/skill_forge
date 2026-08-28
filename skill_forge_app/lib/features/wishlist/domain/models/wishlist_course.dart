class WishlistCourse {
  final String id;
  final String title;
  final String instructor;
  final String category;
  final String imagePath;
  final double rating;
  final String reviewCount;
  final double price;
  final bool isWishlisted;

  const WishlistCourse({
    required this.id,
    required this.title,
    required this.instructor,
    required this.category,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
    required this.price,
    this.isWishlisted = true,
  });
}
