import 'package:covid_nepal/models/global_data_model/global_data.dart';

class MockGlobalData implements GlobalDataRepository {
  @override
  Future<List<GlobalData>> fetchGlobalData() {
    return new Future.value(responseBody);
  }
}

var responseBody = <GlobalData>[
  new GlobalData(
    cases: 165890217,
    todayCases: 50828,
    active: 15823560,
    deaths: 3446070,
    todaysDeaths: 1613,
    recovered: 146606433,
    affectedCountries: 222,
  )
];
