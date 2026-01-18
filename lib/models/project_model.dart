import 'package:flutter/material.dart';

class ProjectModel {
  const ProjectModel({
    required this.leading,
    required this.title,
    required this.description,
    required this.githubUrl,
  });

  final IconData leading;
  final String title;
  final String description;
  final String githubUrl;
}
