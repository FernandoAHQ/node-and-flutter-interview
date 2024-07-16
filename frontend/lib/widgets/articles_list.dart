import 'package:flutter/material.dart';
import 'package:frontend/models/article.dart';
import 'package:frontend/services.dart';
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
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return buildArticleCard(articles[index], context);
        });
  }

  Widget buildArticleCard(Article article, BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchURL(article.url);
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
                        return Image.asset('assets/images/Image-not-found.png',
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
}
