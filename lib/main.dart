import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './news/screens/screens.dart';
import './news/bloc/bloc.dart';
import './news/repository/news_repository.dart';
import './news/data_provider/news_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './newsInfo/bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    initialLocation: '/',
    initialExtra: GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      // GoRoute(
      // path: '/newsDetails',
      // builder: (context, state) => NewsDetails(),
      // ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    NewsRepository newsRepository = NewsRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsFirstBloc>(
          create: (context) => NewsFirstBloc(newsRepository),
        ),
        BlocProvider<NewsSecondBloc>(
          create: (context) => NewsSecondBloc(newsRepository),
        ),
        BlocProvider<NewsInfoBloc>(
          create: (context) => NewsInfoBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Schedule Board',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
      ),
    );
  }
}
