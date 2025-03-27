class Recipe {
  final String id;
  final String name;
  final String imageUrl;
  bool isFavorite = false; // TODO se debe mantener inmutable

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isFavorite,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'],
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
