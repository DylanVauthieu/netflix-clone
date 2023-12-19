import 'package:flutter/material.dart';

class Content {
  final String name;
  final String imageUrl;
  final String titleImageUrl;
  final String videoUrl;
  final String description;
  final Color color;

  const Content({
    required this.name,
    required this.imageUrl,
    this.titleImageUrl = 'null',
    this.videoUrl = 'null',
    this.description = 'null',
    this.color = Colors.transparent,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    print(json);

    return Content(
      name: json['name'],
      imageUrl: json['imageurl'],
      description: json['description'],
      titleImageUrl: json['titleimageurl'],
      videoUrl: json['videourl'],
      color: Color(json['color']),
    );
  }
}
