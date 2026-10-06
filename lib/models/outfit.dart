class Outfit {
  final String id;
  final String title;
  final String category;
  final String description;
  final String style;
  final String occasion;
  final String season;
  final String imagePath;
  final bool isFavorite;

  const Outfit({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.style,
    required this.occasion,
    required this.season,
    required this.imagePath,
    this.isFavorite = false,
  });

  Outfit copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    String? style,
    String? occasion,
    String? season,
    String? imagePath,
    bool? isFavorite,
  }) {
    return Outfit(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      style: style ?? this.style,
      occasion: occasion ?? this.occasion,
      season: season ?? this.season,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}