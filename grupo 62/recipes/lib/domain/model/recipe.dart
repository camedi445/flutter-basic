class Recipe {
  final String name;
  final String imageUrl;
  bool isFavorite = false; // TODO se debe mantener inmutable

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
