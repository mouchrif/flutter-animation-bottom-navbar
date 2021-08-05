import 'package:flutter/material.dart';

class PageItem {
  final String title;
  final IconData icon;
  final Color? color;
  PageItem({required this.title,
  required this.icon,
  this.color});

  static List<PageItem> pagesList = [
    PageItem(
      title: "Home",
      icon: Icons.home,
    ),
    PageItem(
      title: "Favorites",
      icon: Icons.favorite,
    ),
    PageItem(
      title: "Edit",
      icon: Icons.edit,
    ),
    PageItem(
      title: "Setting",
      icon: Icons.settings,
    ),
  ];
}