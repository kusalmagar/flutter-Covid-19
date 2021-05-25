import 'dart:convert';

import 'package:covid_nepal/models/countries_data_model/countries_data.dart';

import 'package:covid_nepal/services/api.dart';
import 'package:covid_nepal/services/api_constants.dart';

class ProdCountriesDataRepository implements CountriesDataRepository {
  @override
  Future<List<CountriesData>> fetchCountriesData() async {
    try {
      var response = await ApiCall().getData(ApiConstants().countryBaseUrl);
      final List responseBody = jsonDecode(response.body);
      final statusCode = response.statusCode;
      if (statusCode != 200 && responseBody == null) {
        throw new FetchDataException1(
            "An error occured during fetching countries data : [Status Code: $statusCode]");
      }
      return responseBody.map((r) => new CountriesData.fromMap(r)).toList();
    } catch (e) {
      print(e);
    }
  }
}
