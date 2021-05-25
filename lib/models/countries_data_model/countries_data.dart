class CountriesData {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int active;
  int recovered;
  int todayRecovered;
  int critical;
  CountryInfo countryInfo;
  CountriesData({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.active,
    this.recovered,
    this.todayRecovered,
    this.critical,
    this.countryInfo,
  });
  CountriesData.fromMap(Map<String, dynamic> map)
      : country = map['country'],
        cases = map['cases'],
        todayCases = map['todayCases'],
        deaths = map['deaths'],
        todayDeaths = map['todayDeaths'],
        active = map['active'],
        recovered = map['recovered'],
        todayRecovered = map['todayRecovered'],
        critical = map['critical'],
        countryInfo = CountryInfo.toMap(map['countryInfo']);
}

class CountryInfo {
  String flag;
  CountryInfo({
    this.flag,
  });
  CountryInfo.toMap(Map<String, dynamic> map) : flag = map['flag'];
}

abstract class CountriesDataRepository {
  Future<List<CountriesData>> fetchCountriesData();
}

class FetchDataException1 implements Exception {
  final _message;

  FetchDataException1([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
