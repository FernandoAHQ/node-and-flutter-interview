import 'package:flutter/material.dart';
import 'package:frontend/widgets/articles_search_results.dart';
import 'package:frontend/widgets/index.dart';

class SearchArticleDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // return const Text('Leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return ArticlesSearchResults(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
