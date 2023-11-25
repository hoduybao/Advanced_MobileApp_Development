class Topic {
  String id;
  String courseId;
  int orderCourse;
  String name;
  String nameFile;
  // Add other properties as needed

  Topic({
    required this.id,
    required this.courseId,
    required this.orderCourse,
    required this.name,
    required this.nameFile,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'],
      courseId: json['courseId'],
      orderCourse: json['orderCourse'],
      name: json['name'],
      nameFile: json['nameFile'],
      // Add other properties as needed
    );
  }
}
