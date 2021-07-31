import "package:flutter/material.dart";
import '../models/article_body.dart';
import '../models/article.dart';

class Detail extends StatelessWidget {
  final Article article;
  Detail(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.article.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _section(this.article.body, Uri(path: this.article.imageUrl))
        ],
      ),
    );
  }

  Widget _section(ArticleBody? articleBody, Uri imageUrl) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amber.shade700,
      ),
      child: Text(articleBody!.description),
    );
  }
}
