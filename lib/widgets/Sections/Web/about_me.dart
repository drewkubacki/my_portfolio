import 'package:flutter/material.dart';
import '../../../example/languages.dart';
import '../../../responsive.dart';
import '../../Cards/language_card.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  Widget languageDesktopBuilder() {
    return Column(
      children: [
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: languages.length,
            itemBuilder: ((context, index) {
              return LanguageCard(language: languages[index]);
            })),
      ],
    );
  }

  Widget languageMobileTabletBuilder() {
    return Column(
      children: [
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: languages.length,
            itemBuilder: ((context, index) {
              return LanguageCard(language: languages[index]);
            })),
      ],
    );
  }

  Widget mobileTabletBuilder(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      //height: height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Hi, I'm Drew Kubacki, an aspiring Flutter Developer with a focus on Hybrid Applications based out of Bloomington, IN. I am a Senior Project Manager turned Developer, looking for my first opportunity to join the industry.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "I hold a degree in Business Informatics from Indiana University and have worked with the following languages:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                languageMobileTabletBuilder(),
                const SizedBox(height: 30),
                Container(
                  width: width,
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.asset('assets/img/headshotImage.jpg'),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget desktopBuilder(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height / 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width / 2,
                  child: Column(
                    children: [
                      const Text(
                        "Hi, I'm Drew Kubacki, an aspiring Flutter Developer with a focus on Hybrid Applications based out of Bloomington, IN. I am a Senior Project Manager turned Developer, looking for my first opportunity to join the industry.",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "I hold a degree in Business Informatics from Indiana University where I was introduced to Object Oriented Programming. I have worked with the following languages:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      languageDesktopBuilder(),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: width / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(75.0),
                      child: Image.asset(
                        'assets/img/headshotImage.jpg',
                        //height: 300,
                        //width: 300,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsive(
        mobile: mobileTabletBuilder(context),
        tablet: mobileTabletBuilder(context),
        desktop: desktopBuilder(context),
      ),
    );
  }
}
