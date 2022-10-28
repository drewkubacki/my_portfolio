import 'package:my_portfolio/models/project.dart';

List<Project> projects = [
  Project(
      name: "Budget Tracking App",
      technologiesUsed: [
        "Flutter",
        "NoSQL",
        "Hive",
        "Provider",
        "ThemeService"
      ],
      year: 2022,
      description:
          "In this app you have the ability to set your own budget, track your expenses and payments as well as utilize theme services for light and dark mode.\n \nThis is the budget tracking application I created while enrolled in SideGuide's Flutter course. \n \nClick the Github button to check out my code!",
      githubUrl: Uri.parse('https://github.com/drewkubacki/budget_tracker'),
      image: "assets/img/budgetTrackingBannerImage.jpg"),
  Project(
      name: "E-Commerce App",
      technologiesUsed: [
        "Flutter",
        "NoSQL",
        "Firebase",
        "RiverPod",
        "ThemeService"
      ],
      year: 2022,
      description:
          "Currently this application has utilized Google's Firebase services for both Authentication and Database storage. You have the ability to sign in as either a user or an admin. The admin has the ability to add and remove items. \n \nThis is the ecommerce application I created while enrolled in SideGuide's Flutter couse. \n \nClick the Github button to check out my code!",
      githubUrl: Uri.parse('https://github.com/drewkubacki/ecommerce'),
      image: "assets/img/ecommerceBannerImage.jpg"),
  Project(
      name: "Flutter Project 3",
      technologiesUsed: ["Pro Create", "Flutter", "Firebase"],
      year: 2020,
      description: "This is my description 3",
      githubUrl: Uri.parse('https://github.com/drewkubacki?tab=repositories'),
      image: "assets/img/budgetTrackingBannerImage.jpg"),
/*   Project(
      name: "Flutter Project 4",
      technologiesUsed: ["Android Studio", "Next.js", "OAuth"],
      year: 2021,
      description: "This is my description 1",
      imageUrl:
          "https://images.unsplash.com/photo-1555774698-0b77e0d5fac6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"),
*/
];
