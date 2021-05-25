import 'package:covid_nepal/models/country_cases_data/country_cases_data.dart';

class MockCountryCasesData implements CountryCasesDataRepository {
  @override
  Future<List<CountryCasesData>> getCountryCasesData(String countryName) {
    return new Future.value(responseBody);
  }
}

var responseBody = <CountryCasesData>[
  new CountryCasesData(
    country: "Nepal",
    cases: 128880,
    todayCases: 8887,
    deaths: 10000,
    todayDeaths: 200,
    recovered: 50003,
    todayRecovered: 4000,
    critical: 0,
  ),
];
