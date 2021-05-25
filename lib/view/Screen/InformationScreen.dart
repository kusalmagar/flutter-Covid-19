import 'package:covid_nepal/models/country_cases_data/country_cases_data.dart';
import 'package:covid_nepal/presenter/country_cases_data_presenter.dart';
import 'package:covid_nepal/view/widgets/showCasesData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InformationScreen extends StatefulWidget {
  final countryName;

  const InformationScreen({Key key, this.countryName}) : super(key: key);
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen>
    implements CountryCasesDataListViewContract {
  bool _isLoading;
  CountryCasesDataListPresenter _countryCasesDataListPresenter;
  List<CountryCasesData> _countryData;
  CountryCasesData countryData;
  _InformationScreenState() {
    _countryCasesDataListPresenter = new CountryCasesDataListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _countryCasesDataListPresenter
        .loadServerResponse(widget.countryName.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.deepPurple[700],
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.lightBlue,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black54,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 10),
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            countryData.countryInfo.flag.toString(),
                            height: 80.0,
                            width: 80.0,
                          ),
                          showCasesData("cases", countryData.cases.toString(),
                              Colors.white),
                          showCasesData("today cases",
                              countryData.todayCases.toString(), Colors.white),
                          showCasesData("active cases",
                              countryData.activeCases.toString(), Colors.white),
                          showCasesData(
                            "deaths",
                            countryData.deaths.toString(),
                            Colors.white,
                          ),
                          showCasesData("today deaths",
                              countryData.todayDeaths.toString(), Colors.white),
                          showCasesData("recovered",
                              countryData.recovered.toString(), Colors.white),
                          showCasesData(
                              "today recovered",
                              countryData.todayRecovered.toString(),
                              Colors.white),
                          showCasesData("critical",
                              countryData.critical.toString(), Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void onCountryCasesDataComplete(List<CountryCasesData> items) {
    setState(() {
      _countryData = items;
      if (_countryData.isNotEmpty) {
        countryData = _countryData[0];
        _isLoading = false;
      } else {
        _isLoading = true;
      }
    });
  }

  @override
  void onCountryCasesDataError() {
    setState(() {
      _isLoading = true;
    });
  }
}
