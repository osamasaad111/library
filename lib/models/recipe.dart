class Book {
  final String title;
  final String publisher;

  Book({required this.title, required this.publisher});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['Title'],
      publisher: json['Publisher'],
    );
  }
}class Recipe {
  final String name;
  final String images;
  final double rating;

  Recipe({required this.name, required this.images, required this.rating});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['title'] as String,
        images: json['cover'] as String,
        rating: json['rating'] as double);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating}';
  }
}
