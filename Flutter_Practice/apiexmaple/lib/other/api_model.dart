class Article {
  Source products;

  Article({
    required this.products,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      products: Source.fromJson(json["products"]),
    );
  }
}

class Source {
  String id;
  String title;
  String description;

  Source({required this.id, required this.title, required this.description});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"] as String,
      title: json["title"] as String,
      description: json["description"] as String,
    );
  }
}
