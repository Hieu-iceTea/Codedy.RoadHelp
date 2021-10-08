class GarageRating {
  final int id;
  final int garageID;
  final int userID;
  final double ratePoint;
  final String comment;

  GarageRating({
    required this.id,
    required this.garageID,
    required this.userID,
    required this.ratePoint,
    required this.comment,
  });
}
