import 'package:equatable/equatable.dart';
import '../models/newsModel.dart';

abstract class NewsFirstState extends Equatable {
  List<News> news = [];
  NewsFirstState();
  @override
  List<Object?> get props => [news];
}

class NewsFirstInitialState extends NewsFirstState {}

class NewsFirstLoadingState extends NewsFirstState {}

class NewsFirstOperationSuccess extends NewsFirstState {
  NewsFirstOperationSuccess(news) {
    super.news = news;
  }
  @override
  List<Object?> get props => [news];
}

class NewsFirstOperationFailure extends NewsFirstState {
  final Object error;
  NewsFirstOperationFailure(this.error);
  @override
  List<Object?> get props => [error];
}

abstract class NewsSecondState extends Equatable {
  List<News> news = [];
  NewsSecondState();
  @override
  List<Object?> get props => [];
}

class NewsSecondInitialState extends NewsSecondState {}

class NewsSecondLoadingState extends NewsSecondState {}

class NewsSecondOperationSuccess extends NewsSecondState {
  NewsSecondOperationSuccess(news) {
    super.news = news;
  }
  @override
  List<Object?> get props => [news];
}

class NewsSecondOperationFailure extends NewsSecondState {
  final Object error;
  NewsSecondOperationFailure(this.error);
  @override
  List<Object?> get props => [error];
}
