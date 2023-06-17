import 'package:equatable/equatable.dart';
import '../model/newsInfoModel.dart';

abstract class NewsInfoState extends Equatable {
  late NewsInfo newsinfo;
  NewsInfoState();
  @override
  List<Object?> get props => [];
}

class InitialNewsInfoState extends NewsInfoState {
  InitialNewsInfoState()
    {
      super.newsinfo = NewsInfo(countryCode: "us", languageCode: "");
  }

  List<Object?> get props => [newsinfo];
}

class NewInfoChange extends NewsInfoState {
  NewInfoChange({countryCode, languageCode}) {
    if (countryCode != null) {
      super.newsinfo.countryCode = countryCode;
    }
    if (languageCode != null) {
      super.newsinfo.languageCode = languageCode;
    }
  }
  @override
  List<Object?> get props => [newsinfo];
}



