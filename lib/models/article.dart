import "./article_body.dart";

class Article {
  final String title;
  final ArticleBody? body;
  final String? imageUrl;
  Article({required this.title, this.body, this.imageUrl});
}
