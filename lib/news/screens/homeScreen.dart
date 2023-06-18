import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../news/bloc/bloc.dart';
import '../../newsInfo/bloc/bloc.dart';
import './homeNews.dart';
import './newsSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Page {
  Home,
  Search,
  Profile,
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Page _currentPage = Page.Home;
  String selectedCountry = "USA";
  void _onTabTapped(Page page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget _getPage() {
    switch (_currentPage) {
      case Page.Home:
        return HomeNews();
      case Page.Search:
        return SearchNews();
      case Page.Profile:
        return Text("bookmark");
      default:
        return HomeNews();
    }
  }

  Widget selectedBar(Page page) {
    IconData icon;
    switch (page) {
      case Page.Home:
        icon = Icons.home;
        break;
      case Page.Search:
        icon = Icons.language;
        break;
      default:
        icon = Icons.home;
    }

    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: _currentPage == page ? Colors.purple : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: IconButton(
        icon: Icon(
          icon,
          color: _currentPage == page ? Colors.white : Colors.grey,
          size: 22,
        ),
        onPressed: () {
          _onTabTapped(page);
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    var newsInfo = context.watch<NewsInfoBloc>().state.newsinfo;
    BlocProvider.of<NewsFirstBloc>(context).add(LoadNewses({
      "language": newsInfo.languageCode,
      "resource": "everything",
      "searchPhrase": "news"
    }));
    BlocProvider.of<NewsSecondBloc>(context).add(LoadHottestNewsEvent({
      "country": newsInfo.countryCode,
      "language": newsInfo.languageCode,
    }));
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.public,
            size: 30,
            color: Colors.purple,
          ),
          title: const Text("News", style: TextStyle(color: Colors.purple)),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text(
        //           'Home News',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 24,
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 200,
        //         child: Row(
        //           children: [
        //             Expanded(child: const Icon(Icons.language)),
        //             Expanded(
        //               child: const SizedBox(
        //                 width: 10,
        //               ),
        //             ),
        //             // Expanded(child: const Text('Language')),
        //             Expanded(
        //               child: DropdownButtonFormField(
        //                 value: selectedCountry,
        //                 items: countryMap.keys.map((String country) {
        //                   return DropdownMenuItem(
        //                     value: country,
        //                     child: Text(country),
        //                   );
        //                 }).toList(),
        //                 onChanged: (value) {
        //                   if (value != null) {
        //                     BlocProvider.of<NewsInfoBloc>(context)
        //                         .add(ChangeCountryEvent(countryMap[value]!));
        //                   }
        //                   setState(() {
        //                     selectedCountry = value.toString();
        //                   });
        //                 },
        //                 decoration: const InputDecoration(
        //                   labelText: 'country',
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       ListTile(
        //         title: const Text('Country'),
        //         onTap: () {
        //         },
        //       ),
        //       ListTile(
        //         onTap: () {
        //           // Handle item 2 tap        //         },
        //       ),
        //     ],
        //   ),
        // ),
        body: _getPage(),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedBar(Page.Home),
                selectedBar(Page.Search),
              ],
            ),
          ),
        ));
  }
}
