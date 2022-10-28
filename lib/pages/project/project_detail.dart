import 'package:flutter/material.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  ProjectDetail({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
        child: Image.asset("assets/icon/githubIcon.png"),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      BackButton(onPressed: () => Navigator.pop(context)),
                      Text(
                        project.name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          project.year.toString(),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Hero(
                    tag: project.name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Responsive(
                        mobile: Image.asset(
                          project.image,
                          fit: BoxFit.cover,
                        ),
                        tablet: Image.asset(
                          project.image,
                          fit: BoxFit.cover,
                        ),
                        desktop: SizedBox(
                          height: 350,
                          child: Image.asset(
                            project.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Technologies",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTechView(
                    techList: project.technologiesUsed ?? [],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Description",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 16,
                      //color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    if (!await launchUrl(project.githubUrl)) {
      throw 'Could not launch $project.githubUrl';
    }
  }
}

class HorizontalTechView extends StatelessWidget {
  final List<String> techList;
  const HorizontalTechView({required this.techList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            margin: const EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              techList[index],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
