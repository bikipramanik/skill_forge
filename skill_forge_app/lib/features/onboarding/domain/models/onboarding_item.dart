class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  static List<OnboardingItem> get items => const [
        OnboardingItem(
          title: 'Master Industry Skills',
          description:
              'Learn from curated courses designed to make you job-ready from day one.',
          imagePath: 'assets/images/onboarding_1.jpg',
        ),
        OnboardingItem(
          title: 'Expert-Led Instruction',
          description:
              'Direct guidance from top-tier professionals and industry leaders in technology and design.',
          imagePath: 'assets/images/onboarding_2.jpg',
        ),
        OnboardingItem(
          title: 'Accelerate Your Career',
          description:
              'Build a professional portfolio and unlock new job opportunities with verified certifications.',
          imagePath: 'assets/images/onboarding_3.jpg',
        ),
      ];
}
