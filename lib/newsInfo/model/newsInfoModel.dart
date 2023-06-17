class NewsInfo {
  String languageCode;
  String countryCode;

  NewsInfo({required this.countryCode, required this.languageCode});
}

Map<String, String> countryMap = {
  'United Arab Emirates': 'ae',
  'Argentina': 'ar',
  'Austria': 'at',
  'Australia': 'au',
  'Belgium': 'be',
  'Bulgaria': 'bg',
  'Switzerland': 'ch',
  'China': 'cn',
  'Czech Republic': 'cz',
  'Germany': 'de',
  'Egypt': 'eg',
  'France': 'fr',
  'United Kingdom': 'gb',
  'Greece': 'gr',
  'Hong Kong': 'hk',
  'Italy': 'it',
  'Japan': 'jp',
  'South Korea': 'kr',
  'Lithuania': 'lt',
  'Latvia': 'lv',
  'Morocco': 'ma',
  'Mexico': 'mx',
  'Netherlands': 'nl',
  'Norway': 'no',
  'New Zealand': 'nz',
  "USA": "us"
};

Map<String, String> languageMap = {
  'Arabic': 'ar',
  'German': 'de',
  'English': 'en',
  'Spanish': 'es',
  'French': 'fr',
  'Hebrew': 'he',
  'Italian': 'it',
  'Dutch': 'nl',
  'Norwegian': 'no',
  'Portuguese': 'pt',
  'Russian': 'ru',
  'Swedish': 'sv',
  'Undefined': 'ud',
  'Chinese': 'zh',
};
