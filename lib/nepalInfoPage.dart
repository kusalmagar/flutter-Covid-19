import 'dart:convert';
import 'dart:async';
import 'package:covid_nepal/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CovidNepal(),
    ));

class CovidNepal extends StatefulWidget {
  @override
  _CovidNepalState createState() => _CovidNepalState();
}

class _CovidNepalState extends State<CovidNepal> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;

  bool isLoading = true;
  Map nepaldata;
  var nepalName;
  var nepalTotalCases;
  var nepalNewCases;
  var nepalActiveCases;
  var nepalTotalDeaths;
  var nepalNewDeaths;
  var nepalTotalRecovered;
  var nepalTotalSerious;
  Future getNepalData() async {
    http.Response nepalResponse = await http.get(nepal);
    if (nepalResponse.statusCode == 200) {
      nepaldata = jsonDecode(nepalResponse.body);
      nepalName = nepaldata['country'].toString();
      nepalTotalCases = nepaldata['cases'].toString();
      nepalActiveCases = nepaldata['active'].toString();
      nepalNewCases = nepaldata['todayCases'].toString();
      nepalTotalDeaths = nepaldata['deaths'].toString();
      nepalNewDeaths = nepaldata['todayDeaths'].toString();
      nepalTotalRecovered = nepaldata['recovered'].toString();
      nepalTotalSerious = nepaldata['critical'].toString();

      setState(() {
        isLoading = false;
      });
    } else {
      _showDialog();
    }
    _showNotification();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Server Error"),
            content: new Text("Connection to server failed"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showNotification() async {
    if (nepalNewCases == "0") {
      print("No new cases");
    } else {
      await _demoNotification();
      print(nepalNewCases);
    }
  }

  Future<void> _demoNotification() async {
    var scheduleNotificationDateTime = DateTime.now().add(Duration(seconds: 1));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channelID',
      'channelName',
      'channelDescription',
      importance: Importance.Max,
      priority: Priority.High,
      ticker: 'test ticker',
    );
    var ioschannelSpecifics = IOSNotificationDetails();
    var plarformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, ioschannelSpecifics);
    //Shows a notification periodically with a specified interval
    await flutterLocalNotificationsPlugin.schedule(
        0,
        "New Cases",
        "$nepalNewCases New cases was found".toString(),
        scheduleNotificationDateTime,
        plarformChannelSpecifics,
        payload: 'Notification was tapped');
  }

  @override
  void initState() {
    super.initState();
    // getCovidData();
    getNepalData();
    initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint("Notification Payload: $payload");
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String poyload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListData() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nepalName.toString(),
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 25.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Total Cases",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.blue),
                      ),
                      Text(
                        nepalTotalCases.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 150,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Active Cases",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.blue),
                      ),
                      Text(
                        nepalActiveCases.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 150,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New Cases",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.blue),
                      ),
                      Text(
                        nepalNewCases.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 150,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Total Deaths",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.blue),
                      ),
                      Text(
                        nepalTotalDeaths.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 150,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New Deaths",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.blue),
                      ),
                      Text(
                        nepalNewDeaths.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 150,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Total Recoverd",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.blue),
                      ),
                      Text(
                        nepalTotalRecovered.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 150,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Serious Cases",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.blue),
                      ),
                      Text(
                        nepalTotalSerious.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Region",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/world.png",
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "'Please Stay Safe, Stay Home!'",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
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
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              // padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                      height: 300.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            // Color(0x1D14C6),
                            // Color(0xFF1129F),
                            Colors.black, Colors.deepPurple[300]
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  "assets/doctor.png",
                                  // width: 250,
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                                Positioned(
                                  top: 20,
                                  left: 170,
                                  child: Text(
                                    "Stay Safe \nStay Home.",
                                    style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.deepPurple[700],
                          ),
                        )
                      : _buildListData(),
                  SizedBox(
                    height: 15.0,
                  ),
                  _buildMap(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
