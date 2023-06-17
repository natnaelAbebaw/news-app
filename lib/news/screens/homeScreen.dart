import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../news/bloc/bloc.dart';
import '../../newsInfo/bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var newsInfo = context.watch<NewsInfoBloc>().state.newsinfo;
    BlocProvider.of<NewsFirstBloc>(context).add(LoadNewses(
        {"country": newsInfo.countryCode, "language": newsInfo.languageCode}));
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Home News',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Language'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: const Text('Country'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text('Dark mode'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<NewsFirstBloc, NewsFirstState>(
        builder: (context, state) {
          if (state is NewsFirstLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NewsFirstOperationSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.news[index].title!));
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
