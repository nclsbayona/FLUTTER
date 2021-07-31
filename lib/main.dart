import 'package:flutter/material.dart';
import 'package:flutter_application_1/mocks/news_fetcher.dart';
import 'detail.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final ForNewsAPI forNewsAPI = ForNewsAPI();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Detail(this.forNewsAPI.getOne()),
      debugShowCheckedModeBanner: false,
    );
  }
}
