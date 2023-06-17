import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';
import '../widgets/newsTileOne.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: BlocBuilder<NewsFirstBloc, NewsFirstState>(
        builder: (context, state) {
          if (state is NewsFirstLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NewsFirstOperationSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsOneTile(news: state.news[index]);
              },
              itemCount: state.news.length,
            );
          }
          if (state is NewsFirstOperationFailure) {
            return Text(state.error.toString());
          }
          return Text("sdsds");
        },
      ),
    );
  }
}
