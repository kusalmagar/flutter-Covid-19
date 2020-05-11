import 'dart:async';
import 'dart:convert';

import 'package:covid_nepal/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

class _WorldDataState extends State<WorldData> {
  bool isLoading = true;
  Map globalData;
  var totalCases;
  var activeCases;
  var totalDeaths;
  var recovered;
  var affectedCountries;
  Future fetchGlobalData() async {
    http.Response worldReponse = await http.get(worldURl);
    if (worldReponse.statusCode == 200) {
      globalData = jsonDecode(worldReponse.body);
      totalCases = globalData['cases'];
      activeCases = globalData['active'];
      totalDeaths = globalData['deaths'];
      recovered = globalData['recovered'];
      affectedCountries = globalData['affectedCountries'];
      setState(() {
        isLoading = false;
      });
    }
  }

  List countryList;
  Future getCountryList() async {
    http.Response worldReponse1 = await http.get(countryUrl);
    if (worldReponse1.statusCode == 200) {
      countryList = jsonDecode(worldReponse1.body);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchGlobalData();
    getCountryList();
  }

  Widget _bulidCountryList() {
    return Container(
      height: 500,
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
        itemCount: countryList == null ? 0 : countryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${countryList[index]['country']}",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              // ),
                              Text(
                                "${countryList[index]['cases']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.green),
                              ),
                              Text(
                                "${countryList[index]['todayCases']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.brown),
                              ),
                              Text(
                                "${countryList[index]['active']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.blue),
                              ),
                              Text(
                                "${countryList[index]['critical']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.indigo),
                              ),
                              Text(
                                "${countryList[index]['deaths']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.red),
                              ),
                              Text(
                                "${countryList[index]['todayDeaths']}",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.pinkAccent[700]),
                              ),
                              Text(
                                "${countryList[index]['recovered']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          countryList[index]['countryInfo']['flag'],
                          height: 30.0,
                          width: 30.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Cases",
                          style: TextStyle(fontSize: 15.0, color: Colors.green),
                        ),
                        Text(
                          "New Cases",
                          style: TextStyle(fontSize: 15.0, color: Colors.brown),
                        ),
                        Text(
                          "Active Cases",
                          style: TextStyle(fontSize: 15.0, color: Colors.blue),
                        ),
                        Text(
                          "Serious Cases",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.indigo),
                        ),
                        Text(
                          "Deaths",
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                        Text(
                          "New Deaths",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.pinkAccent[700]),
                        ),
                        Text(
                          "Recovered",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
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
                                    totalCases.toString(),
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
                                    totalDeaths.toString(),
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
                                    activeCases.toString(),
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
                                    recovered.toString(),
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
                        affectedCountries.toString(),
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
          SizedBox(
            height: 15.0,
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.deepPurple[700],
                  ),
                )
              : Container(
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
                        _buildWorldData(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildAffectedCountries(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _bulidCountryList(),
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
}
