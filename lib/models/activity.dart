class Activity {
  final String time;
  final String title;
  final String location;
  final double price;
  final String availability;
  final String difficulty;
  final String duration;
  final String category;

  final bool isSoldOut;

  Activity({
    required this.time,
    required this.duration,
    required this.title,
    required this.location,
    required this.price,
    required this.availability,
    required this.category,
    required this.difficulty,

    this.isSoldOut = false,
  });
}
