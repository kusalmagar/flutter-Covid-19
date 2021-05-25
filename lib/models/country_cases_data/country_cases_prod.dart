import 'dart:convert';
import 'package:covid_nepal/models/country_cases_data/country_cases_data.dart';
import 'package:covid_nepal/services/api.dart';

class ProdCountryCasesDataRepository implements CountryCasesDataRepository {
  @override
  Future<List<CountryCasesData>> getCountryCasesData(String countryName) async {
    try {
      var response = await ApiCall().getCountryData(countryName);
      final responseBody = jsonDecode(response.body);
      final List responseBody1 = [];
      responseBody1.add(responseBody);
      final statusCode = response.statusCode;
      if (statusCode != 200 && responseBody == null) {
        throw new FetchDataException1(
            "An exception occured during fetching nepal data : [Status code : $statusCode]");
      }
      return responseBody1.map((r) => new CountryCasesData.fromMap(r)).toList();
    } catch (e) {
      print(e);
    }
  }
}
