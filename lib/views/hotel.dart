class Hotel {
  final String title;
  final String secondaryText;
  final String image;

  Hotel({
    required this.title,
    required this.secondaryText,
    required this.image,
  });

  factory Hotel.fromJson(dynamic json) {
    final imageJson = json['image'] as Map<String, dynamic>?;
    return Hotel(
      title: json['title'] as String,
      secondaryText: json['secondaryText'] as String,
      image: imageJson?['urlTemplate'] as String? ?? ' ',
    );
  }

  static List<Hotel> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Hotel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Hotel {title: $title, secondaryText: $secondaryText, image: $image}';
  }
}
