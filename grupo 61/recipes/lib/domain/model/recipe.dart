class Recipe {
  final String id;
  final String name;
  final String imageUrl;
  final bool isFavorite;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isFavorite,
  });

  Recipe copyWith(
      {String? id, String? name, String? imageUrl, bool? isFavorite}) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> jsonMap) {
    return Recipe(
      imageUrl: jsonMap['strMealThumb'],
      name: jsonMap['strMeal'],
      isFavorite: false,
      id: jsonMap['idMeal'],
    );
  }
}
