import 'package:covid_nepal/services/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  getData(apiUrl) async {
    String fullUrl = apiUrl;
    return await http.get(fullUrl, headers: _setHeaders());
  }

  getCountryData(apiUrl) async {
    String fullUrl = ApiConstants().countryCasesBaseURL + apiUrl;
    return await http.get(fullUrl, headers: _setHeaders());
  }
}
