class ArticleBody {
  final String source;
  final String author;
  final String description;
  final String? url;
  ArticleBody(
      {required this.source,
      required this.author,
      required this.description,
      this.url});
}
