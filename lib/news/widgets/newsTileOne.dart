import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/newsModel.dart';

class NewsOneTile extends StatelessWidget {
  News news;
  NewsOneTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 160,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    news.sourceName != null
                        ? FittedBox(
                            child: Text(news.sourceName!,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14)),
                          )
                        : const Text("CNN",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                    news.publishedAt != null
                        ? FittedBox(
                            child: Text(
                                DateFormat()
                                    .add_yMMMEd()
                                    .format(DateTime.parse(news.publishedAt!)),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14)),
                          )
                        : const Text("Feb,20,23",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: news.title != null
                    ? Text(
                        news.title!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    : const Text("CNN"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(children: [
                    Container(
                      width: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      child: Image.asset("assets/jornalist.jpeg"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    news.auther != null
                        ? Text(news.auther!)
                        : const Text("Mike josh",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                  ]))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
            child: news.urlToImage != null
                ? Image.network(
                    news.urlToImage!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/news.jpg",
                    fit: BoxFit.contain,
                  ),
          )
        ],
      ),
    );
  }
}
