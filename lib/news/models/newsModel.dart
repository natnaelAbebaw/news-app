class News {
  String? sourceName;
  String? auther;
  String? title;
  String? description;
  String? publishedAt;
  String? urlToImage;

  News({
    required this.sourceName,
    required this.auther,
    required this.description,
    required this.publishedAt,
    required this.urlToImage,
    required this.title,
  });

  factory News.fromJson(json) {
    return News(
      sourceName: json["source"]["name"],
      auther: json["auther"],
      title: json["title"],
      description: json["description"],
      publishedAt: json["publishedAt"],
      urlToImage: json["urlToImage"],
    );
  }
}
