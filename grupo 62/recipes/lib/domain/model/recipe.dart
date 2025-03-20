class Recipe {
  final String name;
  final String imageUrl;
  final bool isFavorite;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.isFavorite,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      isFavorite: false,
    );
  }
}
/*

   id
   name
   image
   avatarImege
   avatarName
   time
   category
   favorie
   

*/
