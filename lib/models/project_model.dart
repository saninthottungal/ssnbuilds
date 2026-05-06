import 'package:flutter/material.dart';

class ProjectModel {
  const ProjectModel({
    required this.leading,
    required this.title,
    required this.description,
    this.githubUrl,
    this.playstoreUrl,
    this.appstoreUrl,
  });

  final IconData leading;
  final String title;
  final String description;
  final String? githubUrl;
  final String? playstoreUrl;
  final String? appstoreUrl;
}
