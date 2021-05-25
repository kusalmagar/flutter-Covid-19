import 'package:covid_nepal/dependency_injector/dependency_injection.dart';
import 'package:covid_nepal/models/global_data_model/global_data.dart';

abstract class GlobalDataListViewContract {
  void onGlobalDataComplete(List<GlobalData> items);
  void onGlobalDataLoadError();
}

class GlobalDataListPresenter {
  GlobalDataListViewContract _viewContract;
  GlobalDataRepository _repository;

  GlobalDataListPresenter(this._viewContract) {
    _repository = new Injector().globalDataRepository;
  }
  void loadGlobalData() {
    _repository
        .fetchGlobalData()
        .then((sR) => _viewContract.onGlobalDataComplete(sR))
        .catchError((onError) => _viewContract.onGlobalDataLoadError());
  }
}
