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
      image: _getImageUrl(imageJson),
    );
  }

  static List<Hotel> hotelsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Hotel.fromJson(data);
    }).toList();
  }

  static String _getImageUrl(Map<String, dynamic>? imageJson) {
    if (imageJson != null) {
      final maxWidth = imageJson['maxWidth'] as int?;
      final maxHeight = imageJson['maxHeight'] as int?;
      if (maxWidth != null && maxHeight != null) {
        final urlTemplate = imageJson['urlTemplate'] as String?;
        if (urlTemplate != null) {
          return urlTemplate
              .replaceAll('{width}', '$maxWidth')
              .replaceAll('{height}', '$maxHeight');
        }
      }
    }
    return '';
  }

  @override
  String toString() {
    return 'Hotel {title: $title, secondaryText: $secondaryText, imageUrl: $image}';
  }
}
