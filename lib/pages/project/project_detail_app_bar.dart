import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/project.dart';
import '../../services/theme_service.dart';

class ProjectDetailAppBar extends StatelessWidget {
  final Project project;
  const ProjectDetailAppBar({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context, listen: false);
    return AppBar(
      iconTheme: themeService.darkTheme
          ? IconThemeData(color: Colors.white)
          : IconThemeData(color: Colors.black),
      title: Stack(
        children: [
          Text(
            project.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeService.darkTheme ? Colors.white : Colors.black),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0)),
              padding: const EdgeInsets.all(5.0),
              child: Text(
                project.year.toString(),
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
