class GlobalData {
  int cases;
  int todayCases;
  int active;
  int deaths;
  int todaysDeaths;
  int recovered;
  int affectedCountries;
  GlobalData(
      {this.cases,
      this.todayCases,
      this.active,
      this.deaths,
      this.todaysDeaths,
      this.recovered,
      this.affectedCountries});

  GlobalData.fromMap(Map<String, dynamic> map)
      : cases = map['cases'],
        todayCases = map['todayCases'],
        active = map['active'],
        deaths = map['deaths'],
        todaysDeaths = map['todayDeaths'],
        recovered = map['recovered'],
        affectedCountries = map['affectedCountries'];
}

abstract class GlobalDataRepository {
  Future<List<GlobalData>> fetchGlobalData();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
