import 'dart:convert';
import "package:http/http.dart" as http;
import '../models/article.dart';
import '../models/article_body.dart';

class ForNewsAPI {
  final String country = "co";
  final String apiKey = "";
  final String apiUrl;
  int val = 0;
  List<Article>? news;
  ForNewsAPI(
      {this.apiUrl =
          "https://newsapi.org/v2/top-headlines?country=COUNTRY&apiKey=APIKEY"}) {
    this.apiUrl=this.apiUrl.replaceAll("COUNTRY", this.country).replaceAll("APIKEY", this.apiKey);
  }
  Future<List<dynamic>> fetchNews() async {
    var result = await http.get(Uri(host: this.apiUrl));
    return json.decode(result.body)["articles"];
  }

  String _title(dynamic article) {
    return article["title"];
  }

  String _author(dynamic article) {
    return article["author"];
  }

  String _description(dynamic article) {
    return article["description"];
  }

  String _source(dynamic article) {
    return article["source"]["name"];
  }

  String _url(dynamic article) {
    return article["url"];
  }

  String _imageUrl(dynamic article) {
    return article["urlToImage"];
  }

  void _getNews() async {
    var promises = await fetchNews();
    var news =
        List<Article>.generate(promises.length, (index) => Article(title: "A"));
    var i = 0;
    var article;
    for (dynamic art in promises) {
      article = Article(
          title: this._title(art),
          imageUrl: this._imageUrl(art),
          body: ArticleBody(
              author: this._author(art),
              source: this._source(art),
              description: this._description(art),
              url: this._url(art)));
      news[i++] = article;
    }
  }

  Article getOne() {
    if (this.news == null) this._getNews();
    return this.news![this.val++];
  }
}
