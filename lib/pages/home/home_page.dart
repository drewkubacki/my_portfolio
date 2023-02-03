import 'package:flutter/material.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../example/languages.dart';
import '../../widgets/Cards/intro_card.dart';
import '../../services/theme_service.dart';
import '../../widgets/Cards/language_card.dart';
import '../../widgets/Header/header.dart';
import '../../widgets/Cards/project_card.dart';
import 'package:my_portfolio/example/projects.dart';
import '../../widgets/Sections/about_me.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget mobileTabletBuilder(double height) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        },
      ),
    );
  }

  Widget desktopBuilder() {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: projects.length,
            itemBuilder: ((context, index) {
              return ProjectCard(project: projects[index]);
            })),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          //title: const Center(child: Text("Flutter Portfolio")),
          leading: IconButton(
            onPressed: () {
              themeService.darkTheme = !themeService.darkTheme;
            },
            icon: Icon(themeService.darkTheme ? Icons.sunny : Icons.dark_mode),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Share.share(
                    "Check out Drew's portfolio https://drews-portfolio-9c845.web.app/#/");
              },
              icon: Icon(Icons.share),
            ),
          ]),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(height: 25),
                  const Text(
                    "Projects",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Responsive(
                    mobile: mobileTabletBuilder(350),
                    tablet: mobileTabletBuilder(350),
                    desktop: desktopBuilder(),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "About Me",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  AboutMe(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
