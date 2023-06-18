import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/newsModel.dart';

class NewsProvider {
  NewsProvider();
  Future<List<News>> loadNews(Map filter) async {
    var language =
        filter["language"] != null ? "language=${filter["language"]}" : "";
    var searchPhrase =
        filter["searchPhrase"] != null ? "&q=${filter["searchPhrase"]}" : "";
    var country =
        filter["country"] != null ? "&country=${filter["country"]}" : "";
    var category =
        filter["category"] != null ? "&category=${filter["category"]}" : "";
    var startdate =
        "&from=${(DateTime.now().subtract(const Duration(days: 30))).toIso8601String()}";
    var resourse =
        filter["resource"] != null ? filter["resource"] : "top-headlines";
    var uri =
        "https://newsapi.org/v2/$resourse?$language$country$category$searchPhrase$startdate";

    var response = await http.get(Uri.parse(uri), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer ceb2872edc684a18a2f2d2f6b64f1374"
    });

    if (response.statusCode == 200) {
      List newsdata = jsonDecode(response.body)["articles"];
      List<News> news = newsdata.map((newsJson) {
        return News.fromJson(newsJson);
      }).toList();
      return news;
    } else {
      var error = jsonDecode(response.body);
      throw Exception(error["message"]);
    }
  }
}
