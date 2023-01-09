import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uas_rizkyf_2010020008/model/article_model.dart';

class ApiService1 {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'q': 'Mobil Listrik',
      'apiKey': '84f56d0ca7bc422bb706f006ec117cd5'
    };
    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
