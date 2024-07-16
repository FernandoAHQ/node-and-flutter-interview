class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });
  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
      };
}
