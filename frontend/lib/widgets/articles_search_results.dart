import 'package:flutter/material.dart';
import 'package:frontend/providers/articles_provider.dart';
import 'package:frontend/services.dart';
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
    return Container(
      color: Colors.white,
      child: articlesProvider.articlesSearchResponse.articles.isNotEmpty
          ? ListView.builder(
              itemCount:
                  articlesProvider.articlesSearchResponse.articles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchURL(articlesProvider
                            .articlesSearchResponse.articles[index].url);
                      },
                      child: ListTile(
                        leading: SizedBox.fromSize(
                            size: const Size.square(80.0),
                            child: FadeInImage(
                              image: NetworkImage(articlesProvider
                                  .articlesSearchResponse
                                  .articles[index]
                                  .urlToImage),
                              placeholder: const AssetImage(
                                  "assets/images/placeholder.jpg"),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    'assets/images/Image-not-found.png',
                                    fit: BoxFit.cover);
                              },
                              fit: BoxFit.cover,
                            )),
                        title: Text(articlesProvider
                            .articlesSearchResponse.articles[index].title),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            )
          : Container(
              color: Colors.white,
              child: Center(
                  child: SizedBox.fromSize(
                      size: const Size.square(240.0),
                      child: Image.asset('assets/images/no_results.jpg',
                          fit: BoxFit.cover))),
            ),
    );
  }
}
