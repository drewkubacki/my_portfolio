import 'package:flutter/material.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project.dart';
import '../../services/theme_service.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;

  ProjectDetail({required this.project, Key? key}) : super(key: key);

  Widget desktopBuilder(double width) {
    return Row(
      children: [
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
                height: 450,
                child: Image.asset(
                  project.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: width / 20),
        Container(
          width: width / 2.5,
          child: Text(
            project.description,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }

  Widget mobileTabletBuilder() {
    return Hero(
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
            height: 450,
            child: Image.asset(
              project.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final themeService = Provider.of<ThemeService>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
        child: Image.asset("assets/icon/githubIcon.png"),
        backgroundColor: Colors.white,
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
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
                          height: 450,
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
                    textAlign: TextAlign.left,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width >= 1100
                        ? screenSize.width / 2
                        : screenSize.width,
                    child: Text(
                      project.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
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
        shrinkWrap: true,
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
