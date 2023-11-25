import 'package:advanced_mobileapp_development/model/topic-dto.dart';
import 'package:flutter/foundation.dart';

class CourseDTO {
  String id;
  String name;
  String description;
  String imageUrl;
  String level;
  String reason;
  String purpose;
  String otherDetails;
  int defaultPrice;
  int coursePrice;
  // Add other properties as needed

  List<Topic> topics;
  List<Category> categories;

  CourseDTO({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.topics,
    required this.categories,
  });

  factory CourseDTO.fromJson(Map<String, dynamic> json) {
    return CourseDTO(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      level: json['level'],
      reason: json['reason'],
      purpose: json['purpose'],
      otherDetails: json['other_details'],
      defaultPrice: json['default_price'],
      coursePrice: json['course_price'],
      topics: (json['topics'] as List<dynamic>)
          .map((topicJson) => Topic.fromJson(topicJson))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList(),
    );
  }
}


