import "package:flutter_bloc/flutter_bloc.dart";
import './news_event.dart';
import './news_state.dart';
import '../repository/news_repository.dart';
import 'package:http/http.dart' as http;

class NewsFirstBloc extends Bloc<NewsEvent, NewsFirstState> {
  NewsRepository newsRepository;

  NewsFirstBloc(this.newsRepository) : super(NewsFirstInitialState()) {
    on<NewsSearchEvent>((event, emit) async {
      emit(NewsFirstInitialState());
      try {
        var news = await newsRepository.load(event.filter);
        emit(NewsFirstOperationSuccess(news));
      } catch (err) {
        emit(NewsFirstOperationFailure(err));
      }
    });

    on<LoadByCategoryEvent>((event, emit) async {
      emit(NewsFirstInitialState());
      try {
        var news = await newsRepository.load(event.filter);
        emit(NewsFirstOperationSuccess(news));
      } catch (err) {
        emit(NewsFirstOperationFailure(err));
      }
    });

    on<LoadNewses>((event, emit) async {
      try {
        emit(NewsFirstInitialState());
        var news = await newsRepository.load(event.filter);
        emit(NewsFirstOperationSuccess(news));
      } catch (err) {
        emit(NewsFirstOperationFailure(err));
      }
    });
  }
}

class NewsSecondBloc extends Bloc<NewsEvent, NewsSecondState> {
  NewsRepository newsRepository;

  NewsSecondBloc(this.newsRepository) : super(NewsSecondInitialState()) {
    on<LoadHottestNewsEvent>((event, emit) async {
      emit(NewsSecondLoadingState());
      try {
        var news = await newsRepository.load(event.filter);
        emit(NewsSecondOperationSuccess(news));
      } catch (err) {
        emit(NewsSecondOperationFailure(err));
      }
    });
  }
}
