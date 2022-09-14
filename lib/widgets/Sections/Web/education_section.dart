import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scrnWidth = MediaQuery.of(context).size.width;
    var scrnHeight = MediaQuery.of(context).size.height;

    return Container(
        width: scrnWidth,
        height: scrnHeight/2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: scrnWidth / 2.3,
                child: Container(
                  child: Image.network('https://images.unsplash.com/photo-1592609931095-54a2168ae893?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: scrnWidth / 2.3,
                    child: Column(
                      children: const [
                        Text(
                           "Hi, I'm Drew Kubacki, an aspiring Flutter Developer with a focus on Hybrid Applications based out of Bloomington, IN. I am a Senior Project Manager turned Developer, looking for my first opportunity to join the industry.",
                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                           textAlign: TextAlign.center,
                         ),
                        SizedBox(height: 20),
                        Text(
                           "I hold a degree in Business Informatics from Indiana University where I was introduced to Object Oriented Programming. I have worked with the following languages:",
                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                           textAlign: TextAlign.center,
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),

        
    );
  }
}