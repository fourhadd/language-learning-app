class LessonModel {
  final String imagePath;
  final String title;
  final String duration;

  LessonModel({
    required this.imagePath,
    required this.title,
    required this.duration,
  });

  static List<LessonModel> lessons = [
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Introduction",
      duration: "10 minutes 20 seconds",
    ),
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Lesson 01",
      duration: "25 minutes 20 seconds",
    ),
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Lesson 02",
      duration: "13 minutes 20 seconds",
    ),
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Lesson 03",
      duration: "45 minutes 20 seconds",
    ),
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Lesson 04",
      duration: "10 minutes 20 seconds",
    )
  ];
}
