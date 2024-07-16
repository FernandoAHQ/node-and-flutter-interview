import 'package:flutter/material.dart';
import 'package:frontend/delegates/search_delegate.dart';
import 'package:frontend/widgets/index.dart';
import 'package:frontend/providers/articles_provider.dart';
import 'package:frontend/styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<ArticlesProvider>(context, listen: false);
    provider.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final articlesProvider = Provider.of<ArticlesProvider>(context);
    return Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: bgGray,
        body: articlesProvider.isLoading
            ? const LoadingUi()
            : articlesProvider.error.isNotEmpty
                ? ErrorUi(error: articlesProvider.error)
                : ArticlesList(
                    articles: articlesProvider.articlesResponse.articles));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/netforemost.png',
        fit: BoxFit.cover,
        height: 30.0,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            size: 32.0,
          ),
          onPressed: () {
            showSearch(context: context, delegate: SearchArticleDelegate());
          },
        )
      ],
    );
  }
}
