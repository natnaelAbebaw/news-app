import "package:flutter_bloc/flutter_bloc.dart";
import './newsInfoEvent.dart';
import './newsInfoState.dart';

class NewsInfoBloc extends Bloc<NewInfoEvent, NewsInfoState> {
  NewsInfoBloc() : super(InitialNewsInfoState()) {
    on<ChangeCountryEvent>((event, emit) async {
      emit(NewInfoChange(countryCode: event.countryCode));
    });

    on<ChangeLanguageEvent>((event, emit) async {
      emit(NewInfoChange(languageCode: event.languageCode));
    });
  }
}
