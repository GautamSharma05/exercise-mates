class Exercises {
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final String id;
  final String name;
  final String target;

  Exercises({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
  });

  // Factory constructor to create Exercises object from JSON data
  factory Exercises.fromJson(Map<String, dynamic> json) {
    return Exercises(
      bodyPart: json['bodyPart'],
      equipment: json['equipment'],
      gifUrl: json['gifUrl'],
      id: json['id'],
      name: json['name'],
      target: json['target'],
    );
  }
}