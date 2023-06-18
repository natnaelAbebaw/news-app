import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../newsInfo/bloc/newsInfoBlocBloc.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import '../widgets/newsTileOne.dart';
import '../widgets/newsTileTow.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({super.key});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  TextEditingController _textController = TextEditingController();

  List<String> newsCatagory = [
    "all",
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

  int selectedChipIndex = 0;

  void onChipSelected(int index, context) {
    // print(index);
    setState(() {
      selectedChipIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var newsInfo = context.select((NewsInfoBloc bloc) => bloc.state.newsinfo);
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
              "Discover",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "News from all around the world",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Expanded(child: Icon(Icons.search)),
              Expanded(
                flex: 4,
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
                    border: InputBorder.none,
                    // filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  onSubmitted: (String value) {
                    BlocProvider.of<NewsFirstBloc>(context)
                        .add(NewsSearchEvent({
                      "searchPhrase": value,
                      "resource": "everything",
                      "language": newsInfo.languageCode
                    }));
                  },
                ),
              ),
              Expanded(
                  child: Container(
                // color: Colors.black,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list)),
              )),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              margin: EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) =>
                    const Divider(indent: 20, thickness: 10),
                itemBuilder: (context, index) {
                  return ChoiceChip(
                    label: Text(newsCatagory[index]),
                    selected: selectedChipIndex == index,
                    onSelected: (bool selected) {
                      if (newsCatagory[index] == "all") {
                        BlocProvider.of<NewsFirstBloc>(context)
                            .add(LoadByCategoryEvent({
                          "country": newsInfo.countryCode,
                          "language": newsInfo.languageCode,
                        }));
                      } else {
                        BlocProvider.of<NewsFirstBloc>(context)
                            .add(LoadByCategoryEvent({
                          "country": newsInfo.countryCode,
                          "language": newsInfo.languageCode,
                          "category": newsCatagory[index],
                        }));
                      }
                      onChipSelected(
                          selected ? index : selectedChipIndex, context);
                    },
                    selectedColor: Colors.purple,
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                  );
                },
                itemCount: newsCatagory.length,
              )),
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
