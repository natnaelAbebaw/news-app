import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../news/bloc/bloc.dart';
import '../../newsInfo/bloc/bloc.dart';
import '../models/newsModel.dart';
import './homeNews.dart';
import './newsSearch.dart';

class NewsDetails extends StatelessWidget {
  News news;
  NewsDetails({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: news.urlToImage != null
                      ? Image.network(
                          news.urlToImage!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/news.jpg",
                          fit: BoxFit.contain,
                        ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 130,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          child: news.title != null
                              ? Text(
                                  news.title!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : const Text("CNN"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            // width: 250,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Image.asset("assets/jornalist.jpeg"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  news.auther != null
                                      ? Text(news.auther!)
                                      : const Text("Mike josh",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          )),
                                ])),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              // color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  news.sourceName != null
                      ? FittedBox(
                          child: Text(
                              news.sourceName!.length <= 20
                                  ? news.sourceName!
                                  : "${news.sourceName!.substring(0, 20)}...",
                              style: const TextStyle(
                                color: Colors.purple,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              )),
                        )
                      : const Text("CNN",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                  news.publishedAt != null
                      ? FittedBox(
                          child: Text(
                              DateFormat()
                                  .add_yMMMEd()
                                  .format(DateTime.parse(news.publishedAt!)),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              )),
                        )
                      : const Text("Feb,20,23",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              // height: 70,
              child: news.title != null
                  ? Text(news.title!,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 24,
                        letterSpacing: 1.5,
                        height: 1.1,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center)
                  : const Text("CNN"),
            ),
            const SizedBox(
              height: 20,
            ),
            news.description != null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    child: Text(news.description!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          letterSpacing: 2,
                          height: 1.5,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.grey[100],
                    padding: const EdgeInsets.all(20),
                    child: Text("No Description",
                        style: TextStyle(
                          color: Colors.grey[800],
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        )),
                  ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
