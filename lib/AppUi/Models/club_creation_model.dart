class ClubCreationModel {
  String name;
  String about;
  String? imagePath;

  ClubCreationModel({
    required this.name,
    required this.about,
    this.imagePath,
  });
}

