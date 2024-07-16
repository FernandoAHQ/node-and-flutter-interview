import 'package:flutter/material.dart';
import 'package:frontend/models/article.dart';
import 'package:frontend/styles.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key, required this.articles});
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    print(articles);
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return buildArticleCard(articles[index], context);
        });
  }

  Widget buildArticleCard(Article article, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(article.url);
      },
      child: Container(
        height: 120.0,
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 14.0),
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Expanded(
            child: Row(
              children: [
                SizedBox.fromSize(
                    size: const Size.square(120.0),
                    child: FadeInImage(
                      image: NetworkImage(article.urlToImage),
                      placeholder:
                          const AssetImage("assets/images/placeholder.jpg"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/error.jpg',
                            fit: BoxFit.cover);
                      },
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: header1,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                          ),
                          Text(
                            article.author,
                            style: header3,
                          ),
                          Text(
                            article.description,
                            style: header2,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildArticleTile(Article article, BuildContext context) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: SizedBox.fromSize(
              size: Size.square(100),
              child: FadeInImage(
                image: NetworkImage(article.urlToImage),
                placeholder: const AssetImage("assets/images/placeholder.jpg"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/error.jpg',
                      fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              )),
        ),
        title: Text(article.title,
            style: header1, overflow: TextOverflow.ellipsis, maxLines: 1),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.author,
              style: header3,
            ),
            Text(article.description,
                style: header2, overflow: TextOverflow.ellipsis, maxLines: 2),
          ],
        ));
  }
}

_launchURL(String articleUrl) async {
  final Uri url = Uri.parse(articleUrl);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
