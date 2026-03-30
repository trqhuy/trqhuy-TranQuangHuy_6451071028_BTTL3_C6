import 'package:flutter/material.dart';

class InterestItem {
  final String title;
  final IconData icon;
  bool isSelected;

  InterestItem({required this.title, required this.icon, this.isSelected = false});
}