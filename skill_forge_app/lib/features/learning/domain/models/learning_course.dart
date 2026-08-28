enum CourseStatus {
  inProgress('In Progress'),
  completed('Completed'),
  notStarted('Not Started');

  final String label;
  const CourseStatus(this.label);
}

class LearningCourse {
  final String id;
  final String title;
  final String category;
  final String imagePath;
  final String lastAccessed;
  final int completedLessons;
  final int totalLessons;
  final double progressPercent;
  final CourseStatus status;
  final bool isCompleted;
  final String? completedDate;

  const LearningCourse({
    required this.id,
    required this.title,
    required this.category,
    required this.imagePath,
    required this.lastAccessed,
    required this.completedLessons,
    required this.totalLessons,
    required this.progressPercent,
    this.status = CourseStatus.inProgress,
    this.isCompleted = false,
    this.completedDate,
  });
}
