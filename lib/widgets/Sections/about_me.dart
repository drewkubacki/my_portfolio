import 'package:flutter/material.dart';
import '../../example/languages.dart';
import '../../responsive.dart';
import '../Cards/language_card.dart';
import 'contact_me.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  //Builds the grid of Languages which is below the text in the about me section
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

  //Builds the grid of Languages which is below the text in the about me section
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

  //Builds the page for both Mobile and Tablet
  Widget mobileTabletBuilder(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
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
                  "Hi, I'm Drew Kubacki, an aspiring Flutter Developer with a focus on Hybrid Applications based out of Bloomington, IN. I am a Senior Project Manager and Developer, looking for opportunities to utilize my growing skillset.",
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
                    width: width / 1.2,
                    //height: height / 1.5,
                    margin: EdgeInsets.only(top: 20.0),
                    child: ContactMe()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Builds the page for the Desktop
  Widget desktopBuilder(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: height / 2.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 2,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            offset: const Offset(5, 15),
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 15,
                          )
                        ]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'assets/img/lunaAndMe.jpg',
                              width: width / 6,
                              fit: BoxFit.fill,
                            )),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Hi, I'm Drew Kubacki, an aspiring Flutter Developer with a focus on Hybrid Applications based out of Bloomington, IN. I am a Senior Project Manager and Developer, looking for opportunities to utilize my growing skillset.",
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
                width: width / 3,
                height: height / 1.5,
                constraints: BoxConstraints(maxHeight: 475),
                margin: EdgeInsets.only(left: 35.0),
                child: ContactMe()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: mobileTabletBuilder(context),
      tablet: mobileTabletBuilder(context),
      desktop: desktopBuilder(context),
    );
  }
}
