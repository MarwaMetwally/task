import 'package:flutter/material.dart';
import 'package:mytask/pages/add_task_screen.dart';
import 'package:mytask/pages/home_screen.dart';

import 'route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case addTaskRoute:
        return MaterialPageRoute(
          builder: (context) => const AddTaskScreen(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
