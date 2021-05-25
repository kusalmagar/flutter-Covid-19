import 'package:covid_nepal/models/countries_data_model/countries_data.dart';
import 'package:covid_nepal/models/countries_data_model/countries_data_mock.dart';
import 'package:covid_nepal/models/countries_data_model/countries_data_prod.dart';
import 'package:covid_nepal/models/country_cases_data/country_cases_data.dart';
import 'package:covid_nepal/models/country_cases_data/country_cases_prod.dart';
import 'package:covid_nepal/models/country_cases_data/county_cases_mock.dart';
import 'package:covid_nepal/models/global_data_model/global_data.dart';
import 'package:covid_nepal/models/global_data_model/global_data_mock.dart';
import 'package:covid_nepal/models/global_data_model/global_data_prod.dart';

enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _singelton = new Injector._internal();
  static Flavor _flavor;
  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singelton;
  }
  Injector._internal();

  CountryCasesDataRepository get countryCasesDataRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockCountryCasesData();

      default:
        return new ProdCountryCasesDataRepository();
    }
  }

  GlobalDataRepository get globalDataRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockGlobalData();
      default:
        return new ProdGlobalDataRepository();
    }
  }

  CountriesDataRepository get countriesDataRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockCountriesData();
      default:
        return new ProdCountriesDataRepository();
    }
  }
}
