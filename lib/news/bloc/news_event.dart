import 'package:equatable/equatable.dart';
import '../models/newsModel.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsSearchEvent extends NewsEvent {
  Map filter;
  NewsSearchEvent(this.filter);
  @override
  List<Object?> get props => [];
}

class LoadByCategoryEvent extends NewsEvent {
  Map filter;
  LoadByCategoryEvent(this.filter);
  @override
  List<Object?> get props => [];
}

class LoadHottestNewsEvent extends NewsEvent {
  Map filter;
  LoadHottestNewsEvent(this.filter);
  @override
  List<Object?> get props => [];
}

class LoadNewses extends NewsEvent {
  Map filter;
  LoadNewses(this.filter);
  @override
  List<Object?> get props => [];
}
