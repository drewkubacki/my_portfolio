class Project {
  String name;
  int year;
  String description;
  String image;
  Uri githubUrl;
  List<String>? technologiesUsed;

  Project({
    required this.name,
    required this.year,
    required this.description,
    required this.image,
    required this.githubUrl,
    this.technologiesUsed,
  });
}
