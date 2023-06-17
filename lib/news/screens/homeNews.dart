import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';
import '../widgets/newsTileOne.dart';
import '../widgets/newsTileTow.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.0125, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Hottest News",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<NewsSecondBloc, NewsSecondState>(
              builder: (context, state) {
            if (state is NewsSecondOperationSuccess) {
              return Container(
                padding: const EdgeInsets.all(10),
                height: 320,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsTwoTile(news: state.news[index]);
                  },
                  itemCount: state.news.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                ),
              );
            } else if (state is NewsSecondOperationFailure) {
              return Text(state.error.toString());
            } else {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.purple));
            }
          }),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Recommendation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.0125,
                vertical: 10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: BlocBuilder<NewsFirstBloc, NewsFirstState>(
              builder: (context, state) {
                if (state is NewsFirstOperationSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsOneTile(news: state.news[index]);
                    },
                    itemCount: state.news.length,
                  );
                }
                if (state is NewsFirstOperationFailure) {
                  return Text(state.error.toString());
                } else {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.purple));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
