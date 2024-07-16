import 'package:flutter/material.dart';
import 'package:frontend/providers/articles_provider.dart';
import 'package:provider/provider.dart';

class ArticlesSearchResults extends StatefulWidget {
  const ArticlesSearchResults({super.key, required this.query});
  final String query;
  @override
  State<ArticlesSearchResults> createState() => _ArticlesSearchResultsState();
}

class _ArticlesSearchResultsState extends State<ArticlesSearchResults> {
  @override
  void initState() {
    final provider = Provider.of<ArticlesProvider>(context, listen: false);
    provider.searchArticles(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final articlesProvider = Provider.of<ArticlesProvider>(context);
    return ListView.builder(
      itemCount: articlesProvider.articlesSearchResponse.articles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              articlesProvider.articlesSearchResponse.articles[index].title),
        );
      },
    );
  }
}
