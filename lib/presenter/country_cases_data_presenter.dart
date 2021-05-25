import 'package:covid_nepal/dependency_injector/dependency_injection.dart';
import 'package:covid_nepal/models/country_cases_data/country_cases_data.dart';

abstract class CountryCasesDataListViewContract {
  void onCountryCasesDataComplete(List<CountryCasesData> items);
  void onCountryCasesDataError();
}

class CountryCasesDataListPresenter {
  CountryCasesDataListViewContract _viewContract;
  CountryCasesDataRepository _repository;

  CountryCasesDataListPresenter(this._viewContract) {
    _repository = new Injector().countryCasesDataRepository;
  }

  void loadServerResponse(String countryName) {
    _repository
        .getCountryCasesData(countryName)
        .then((sR) => _viewContract.onCountryCasesDataComplete(sR))
        .catchError((onError) => _viewContract.onCountryCasesDataError());
  }
}
