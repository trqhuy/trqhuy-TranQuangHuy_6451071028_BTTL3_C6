import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/profile_screen.dart';

class RouteManager {
  static const String home = '/';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      profile: (context) => const ProfileScreen(),
    };
  }
}