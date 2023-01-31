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
        "Stripe",
        "RiverPod",
        "ThemeService"
      ],
      year: 2022,
      description:
          "Currently this application has utilized Google's Firebase services for both Authentication and Database storage. You have the ability to sign in as either a user or an admin. The admin has the ability to add and remove items. \n \nThis is the ecommerce application I created while enrolled in SideGuide's Flutter couse. \n \nClick the Github button to check out my code!",
      githubUrl: Uri.parse('https://github.com/drewkubacki/ecommerce'),
      image: "assets/img/ecommerceBannerImage.jpg"),
  Project(
      name: "Tricktionary",
      technologiesUsed: [
        "Flutter",
        "Firebase",
        "NoSQL",
        "Riverpod",
      ],
      year: 2023,
      description:
          "This application is currently in progress and will utilize Google's Firebase services for Database storage. In this application you have the ability to randomly select a trick from a list of tricks. \nI have plans to continue building on this application to track scores and game wins with your friends! \n \nClick the Github button to check out my code!",
      githubUrl: Uri.parse('https://github.com/drewkubacki/tricktionary'),
      image: "assets/img/tricktionaryBannerImage1.jpg"),
];
