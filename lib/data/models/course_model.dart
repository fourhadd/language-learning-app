import 'package:flutter/material.dart';

class CourseModel {
  final String image;
  final String name;
  final int colorValue;

  CourseModel({
    required this.image,
    required this.name,
    required this.colorValue,
  });

  Color get color => Color(colorValue);

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      image: json['image'] as String,
      name: json['name'] as String,
      colorValue: json['colorValue'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'colorValue': colorValue,
    };
  }
}
