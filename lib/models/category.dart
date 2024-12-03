import 'package:flutter/material.dart';

class Category {
  final String label;
  final Color color;
  final IconData? icon;
  final String? imagePath;

  Category({
    this.imagePath,
    required this.label,
    required this.color,
    this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      label: json['label'],
      color: Color(int.parse(json['color'], radix: 16)),
      icon: json['icon'] != null ? IconData(json['icon'], fontFamily: 'MaterialIcons') : null,
      imagePath: json['imagePath'],
    );
  }
}

List<Category> categories = [
  Category(imagePath: 'assets/images/i1.png', label: 'Dentistry', color: Color(0xFFDC9497)),
  Category(imagePath: 'assets/images/i2.png', label: 'Cardiology', color: Color(0xFF93C19E)),
  Category(imagePath: 'assets/images/i3.png', label: 'Pulmonology', color: Color(0xFFF5AD7E)),
  Category(imagePath: 'assets/images/i4.png', label: 'General', color: Color(0xFFACA1CD)),
  Category(imagePath: 'assets/images/i5.png', label: 'Neurology', color: Color(0xFF4D9B91)),
  Category(imagePath: 'assets/images/i6.png', label: 'Gastroenterology', color: Color(0xFF352261)),
  Category(icon: Icons.biotech, label: 'Laboratory', color: Color(0xFFDEB6B5)),
  Category(imagePath: 'assets/images/i8.png', label: 'Vaccination', color: Color(0xFFACA1CD)),
];
