import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/project/project_detail_app_bar.dart';
import 'package:my_portfolio/pages/project/project_screenshots_display.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project.dart';
import '../../responsive.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  const ProjectDetail({super.key, required this.project});

  Widget desktopBuilder(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: project.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: SizedBox(
                  height: 350,
                  child: Image.asset(
                    project.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: screenSize.width / 2.2,
              margin: const EdgeInsets.only(left: 30.0),
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 15),
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 15,
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      project.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  HorizontalTechView(techList: project.technologiesUsed ?? []),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget tabletBuilder(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: project.name,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              height: 250,
              project.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 15),
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 15,
                )
              ]),
          width: screenSize.width / 2.2,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 30.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  project.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                  padding: const EdgeInsets.only(right: 10.0),
                  child:
                      GridTechView(techList: project.technologiesUsed ?? [])),
            ],
          ),
        )
      ],
    );
  }

  Widget mobileBuilder(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Hero(
          tag: project.name,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: const Offset(5, 15),
                color: Colors.black.withOpacity(.1),
                blurRadius: 15,
              )
            ]),
            margin:
                const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                project.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: screenSize.width,
          margin:
              const EdgeInsets.only(top: 15, left: 35, right: 35, bottom: 15),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 15),
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 15,
                )
              ]),
          child: Column(
            children: [
              HorizontalTechView(techList: project.technologiesUsed ?? []),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  project.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
        backgroundColor: Colors.white,
        child: Image.asset("assets/icon/githubIcon.png"),
      ),
      extendBodyBehindAppBar: true,
      //Utilized the preferred size widget to allow for a custom app bar widget
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: ProjectDetailAppBar(project: project)),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Responsive(
                mobile: mobileBuilder(context),
                tablet: tabletBuilder(context),
                desktop: desktopBuilder(context),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: screenSize.width / 1.3,
                height: screenSize.height / 1.5,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ProjectScreenshotsDisplay(
                      screenshotList: project.screenshots ?? []),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Sends the user to the Github repository when the FAB is tapped
  Future<void> _launchURL() async {
    if (!await launchUrl(project.githubUrl)) {
      throw 'Could not launch $project.githubUrl';
    }
  }
}

//Builds the list of technologies which were used on the specific project for Tablet
class GridTechView extends StatelessWidget {
  final List<String> techList;
  const GridTechView({super.key, required this.techList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (5 / 2),
        crossAxisCount: 4,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: techList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            techList[index],
          ),
        );
      },
    );
  }
}

//Builds the list of technologies which were used on the specific project
class HorizontalTechView extends StatelessWidget {
  final List<String> techList;
  const HorizontalTechView({required this.techList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: techList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
              techList[index],
            ),
          );
        },
      ),
    );
  }
}
