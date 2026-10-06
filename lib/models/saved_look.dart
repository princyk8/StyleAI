class SavedLook {
  final String id;
  final String title;
  final String imagePath;
  final String category;
  final String description;
  final DateTime savedAt;

  const SavedLook({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.savedAt,
  });

  SavedLook copyWith({
    String? id,
    String? title,
    String? imagePath,
    String? category,
    String? description,
    DateTime? savedAt,
  }) {
    return SavedLook(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      description: description ?? this.description,
      savedAt: savedAt ?? this.savedAt,
    );
  }
}