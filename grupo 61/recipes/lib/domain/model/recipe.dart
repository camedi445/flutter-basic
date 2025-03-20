class Recipe {
  final String name;
  final String imageUrl;
  bool isFavorite = false; // TODO cambiar a inmutable

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.isFavorite,
  });

  factory Recipe.fromJson(Map<String, dynamic> jsonMap) {
    return Recipe(
      imageUrl: jsonMap['strMealThumb'],
      name: jsonMap['strMeal'],
      isFavorite: false,
    );
  }
}
