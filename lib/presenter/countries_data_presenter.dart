import 'package:covid_nepal/dependency_injector/dependency_injection.dart';
import 'package:covid_nepal/models/countries_data_model/countries_data.dart';

abstract class CountriesDataListViewContract {
  void onCountriesDataComplete(List<CountriesData> items);
  void onCountriesDataError();
}

class CountriesDataListPresenter {
  CountriesDataListViewContract _viewContract;
  CountriesDataRepository _repository;

  CountriesDataListPresenter(this._viewContract) {
    _repository = new Injector().countriesDataRepository;
  }

  void loadCountryData() {
    _repository
        .fetchCountriesData()
        .then((sR) => _viewContract.onCountriesDataComplete(sR))
        .catchError((onError) => _viewContract.onCountriesDataError());
  }
}
