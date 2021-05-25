import 'package:covid_nepal/models/countries_data_model/countries_data.dart';

class MockCountriesData implements CountriesDataRepository {
  @override
  Future<List<CountriesData>> fetchCountriesData() {
    return new Future.value(responseBody);
  }
}

var responseBody = <CountriesData>[
  new CountriesData(
    country: "Nepal",
    cases: 497052,
    todayCases: 8407,
    active: 116192,
    deaths: 6024,
    todayDeaths: 177,
    recovered: 374836,
    todayRecovered: 7890,
    critical: 0,
  )
];
