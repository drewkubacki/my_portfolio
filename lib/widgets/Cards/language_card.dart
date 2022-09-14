import 'package:flutter/material.dart';
import '../../models/language.dart';

class LanguageCard extends StatelessWidget {
  final Language language;

  const LanguageCard({required this.language, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                language.imagePath,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              language.name,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
