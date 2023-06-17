import 'package:equatable/equatable.dart';

abstract class NewInfoEvent extends Equatable {
  const NewInfoEvent();
}

class ChangeLanguageEvent extends NewInfoEvent {
  String languageCode;
  ChangeLanguageEvent(this.languageCode);
  @override
  List<Object?> get props => [];
}

class ChangeCountryEvent extends NewInfoEvent {
  String countryCode;
  ChangeCountryEvent(this.countryCode);
  @override
  List<Object?> get props => [];
}
