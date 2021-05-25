class CountryCasesData {
  String country;
  int cases;
  int todayCases;
  int activeCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int critical;
  CountryInfo countryInfo;

  CountryCasesData({
    this.country,
    this.cases,
    this.todayCases,
    this.activeCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.critical,
    this.countryInfo,
  });
  CountryCasesData.fromMap(Map<String, dynamic> map)
      : country = map['country'],
        cases = map['cases'],
        todayCases = map['todayCases'],
        activeCases = map['active'],
        deaths = map['deaths'],
        todayDeaths = map['todayDeaths'],
        recovered = map["recovered"],
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

abstract class CountryCasesDataRepository {
  Future<List<CountryCasesData>> getCountryCasesData(String countryName);
}

class FetchDataException1 implements Exception {
  final _message;

  FetchDataException1([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
