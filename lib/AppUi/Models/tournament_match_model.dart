class TournamentMatchModel {
  final String label;
  final String teamA;
  final String teamB;
  final String imgA;
  final String imgB;
  final String time;
  final String? scoreA;
  final String? scoreB;
  final bool isLive;

  TournamentMatchModel({
    required this.label,
    required this.teamA,
    required this.teamB,
    required this.imgA,
    required this.imgB,
    required this.time,
    this.scoreA,
    this.scoreB,
    this.isLive = false,
  });
}
