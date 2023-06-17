import '../data_provider/news_provider.dart';
import '../models/newsModel.dart';

class NewsRepository {
  NewsRepository();

  Future<List<News>> load(Map filter) async {
    return await NewsProvider().loadNews(filter);
  }
}
