import 'dart:convert';

import 'package:frontend/models/article.dart';

ArticlesResponse articlesResponseFromJson(String str) =>
    ArticlesResponse.fromJson(json.decode(str));

String articlesResponseToJson(ArticlesResponse data) =>
    json.encode(data.toJson());

class ArticlesResponse {
  ArticlesResponse({
    required this.status,
    required this.articles,
  });

  bool status;
  List<Article> articles;

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      ArticlesResponse(
        status: json["status"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
