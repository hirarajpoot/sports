class Tournament {
  String name;
  String description;
  String logoPath;
  int numberOfTeams;
  List<String> selectedTeams;
  DateTime? startDate;
  DateTime? endDate;

  Tournament({
    required this.name,
    required this.description,
    required this.logoPath,
    required this.numberOfTeams,
    required this.selectedTeams,
    this.startDate,
    this.endDate,
  });
}
