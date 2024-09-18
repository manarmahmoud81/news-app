import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/NewsDataModel.dart';

import '../screens/news_screen/view_news.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ViewNews(articles: articles);
            //   ViewNews(
            //
            //   title: articles.title??"",
            //   author: articles.author??"",
            //   desc: articles.description??"",
            //   publishedAt: articles.publishedAt??"",
            //   urlToImage: articles.urlToImage??"",
            // );
          },
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18)),
                child: Image.network(
                  articles.urlToImage ?? "",
                  height: 232,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                articles.title ?? "",
                maxLines: 2,
                style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                articles.description ?? "",
                maxLines: 2,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    articles.author ?? "0",
                    style: GoogleFonts.elMessiri(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(articles.publishedAt?.substring(0, 10) ?? ""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
