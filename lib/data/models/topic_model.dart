import 'package:flutter/material.dart';

class TopicModel {
  final String topic;
  final String points;
  final String time;
  final String image;
  final Color color;
  final List<BoxShadow>? boxShadow;

  TopicModel({
    required this.topic,   
    required this.points,  
    required this.time,    
    required this.image,   
    required this.color,  
    this.boxShadow,       
  });
}