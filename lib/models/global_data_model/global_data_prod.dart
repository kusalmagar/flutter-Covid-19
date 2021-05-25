import 'dart:convert';

import 'package:covid_nepal/models/global_data_model/global_data.dart';
import 'package:covid_nepal/services/api.dart';
import 'package:covid_nepal/services/api_constants.dart';

class ProdGlobalDataRepository implements GlobalDataRepository {
  @override
  Future<List<GlobalData>> fetchGlobalData() async {
    try {
      var response = await ApiCall().getData(ApiConstants().worldBaseURl);
      final responseBody = jsonDecode(response.body);
      final List responseBody1 = [];
      responseBody1.add(responseBody);
      final statusCode = response.statusCode;

      if (statusCode != 200 && responseBody == null) {
        throw new FetchDataException(
            "An exception occured during fetching global data : {Status Code : $statusCode]");
      }
      return responseBody1
          .map((globalData) => new GlobalData.fromMap(globalData))
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
