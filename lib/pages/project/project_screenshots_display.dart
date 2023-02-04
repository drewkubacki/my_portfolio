import 'package:flutter/material.dart';

class ProjectScreenshotsDisplay extends StatelessWidget {
  final List<String> screenshotList;
  const ProjectScreenshotsDisplay({
    super.key,
    required this.screenshotList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: screenshotList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.asset(screenshotList[index]);
        },
      ),
    );
  }
}
