import 'package:covid_nepal/models/countries_data_model/countries_data.dart';

import 'package:covid_nepal/models/global_data_model/global_data.dart';
import 'package:covid_nepal/presenter/countries_data_presenter.dart';
import 'package:covid_nepal/presenter/global_data_presenter.dart';
import 'package:covid_nepal/view/widgets/SearchBar.dart';
import 'package:covid_nepal/view/widgets/showCasesData.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WorldData(),
      ),
    );

class WorldData extends StatefulWidget {
  @override
  _WorldDataState createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData>
    implements CountriesDataListViewContract, GlobalDataListViewContract {
  bool _isGlobalDataLoading;
  GlobalDataListPresenter _globalDataListPresenter;
  List<GlobalData> _globalData;
  GlobalData globalData;
  bool _isCountryDataLoading;
  CountriesDataListPresenter _countriesDataListPresenter;
  List<CountriesData> _countriesData;

  _WorldDataState() {
    _globalDataListPresenter = new GlobalDataListPresenter(this);
    _countriesDataListPresenter = new CountriesDataListPresenter(this);
  }

  @override
  void initState() {
    super.initState();

    _isCountryDataLoading = true;
    _isGlobalDataLoading = true;
    _globalDataListPresenter.loadGlobalData();
    _countriesDataListPresenter.loadCountryData();
  }

  Widget _bulidCountryList() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 10),
            blurRadius: 10.0,
          )
        ],
      ),
      child: ListView.builder(
        itemCount: _countriesData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.green[900],
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  countryInnfo(
                    _countriesData[index].country,
                    _countriesData[index].countryInfo.flag.toString(),
                    Colors.white,
                    FontWeight.bold,
                  ),
                  showCasesData(
                    "Cases",
                    _countriesData[index].cases.toString(),
                    Colors.white,
                  ),
                  showCasesData(
                    "New Cases",
                    _countriesData[index].todayCases.toString(),
                    Colors.white,
                  ),
                  showCasesData(
                    "Active Cases",
                    _countriesData[index].active.toString(),
                    Colors.white,
                  ),
                  showCasesData(
                    "Deaths",
                    _countriesData[index].deaths.toString(),
                    Colors.white,
                  ),
                  showCasesData(
                    "New Deaths",
                    _countriesData[index].todayDeaths.toString(),
                    Colors.white,
                  ),
                  showCasesData(
                    "Critical",
                    _countriesData[index].critical.toString(),
                    Colors.white,
                  ),
                  showCasesData(
                    "Recovered",
                    _countriesData[index].recovered.toString(),
                    Colors.white,
                  ),
                  showCasesData(
                    "Today Recovered",
                    _countriesData[index].todayRecovered.toString(),
                    Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWorldData() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text(
            "World Data",
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 25.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            // scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0, 10),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total cases",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/totalCases.png",
                                    width: 15,
                                    fit: BoxFit.fitWidth,
                                    // alignment: Alignment.topCenter,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    globalData.cases.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0, 10),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total Deaths",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/offline.png",
                                    width: 15,
                                    fit: BoxFit.fitWidth,
                                    // alignment: Alignment.topCenter,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    globalData.deaths.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 15.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0, 10),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Active cases",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/recovered.png",
                                    width: 15,
                                    fit: BoxFit.fitWidth,
                                    // alignment: Alignment.topCenter,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    globalData.active.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0, 10),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Recovered",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/online.png",
                                    width: 15,
                                    fit: BoxFit.fitWidth,
                                    // alignment: Alignment.topCenter,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    globalData.recovered.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 15.0,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAffectedCountries() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 10),
                  blurRadius: 10.0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/sad-face.png",
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Affected Countries",
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20.0,
                          color: Colors.blue,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        globalData.affectedCountries.toString(),
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _isGlobalDataLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.deepPurple[700],
                          ),
                        )
                      : Column(
                          children: [
                            _isCountryDataLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.deepPurple[700],
                                    ),
                                  )
                                : SearchBar(
                                    countryDetails: _countriesData,
                                  ),
                            _buildWorldData(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _buildAffectedCountries(),
                          ],
                        ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _isCountryDataLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.deepPurple[700],
                          ),
                        )
                      : _bulidCountryList(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void onCountriesDataComplete(List<CountriesData> items) {
    setState(() {
      _countriesData = items;
      if (_countriesData.isNotEmpty) {
        _isCountryDataLoading = false;
      } else {
        _isCountryDataLoading = true;
      }
    });
  }

  @override
  void onCountriesDataError() {
    setState(() {
      _isCountryDataLoading = true;
      print("unable to fetch country data");
    });
  }

  @override
  void onGlobalDataComplete(List<GlobalData> items) {
    setState(() {
      _globalData = items;
      if (_globalData.isNotEmpty) {
        globalData = _globalData[0];
        _isGlobalDataLoading = false;
      } else {
        globalData = _globalData[0];
        _isGlobalDataLoading = true;
      }
    });
  }

  @override
  void onGlobalDataLoadError() {
    setState(() {
      _isGlobalDataLoading = true;
      print("unable to fetch global data");
    });
  }
}
