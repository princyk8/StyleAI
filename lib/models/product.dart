class Product {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imagePath;
  final double price;
  final String brand;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imagePath,
    required this.price,
    this.brand = '',
    this.isFavorite = false,
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imagePath,
    double? price,
    String? brand,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}