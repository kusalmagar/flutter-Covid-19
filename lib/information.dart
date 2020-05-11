import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfromationPage(),
    ));

class InfromationPage extends StatefulWidget {
  @override
  _InfromationPageState createState() => _InfromationPageState();
}

class _InfromationPageState extends State<InfromationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // controller: controlller,
        child: Column(
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
                      colors: [Colors.black, Colors.deepPurple[300]]),
                  // image: DecorationImage(
                  //   image: AssetImage("assets/female-doc.png"),
                  // )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            "assets/female-doc.png",
                            width: 100,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          Positioned(
                            top: 20,
                            left: 100,
                            child: Text(
                              "Get info \nAbout Covid-19",
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Preventions",
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 280,
                          width: 180,
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
                                "Wash Hands",
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                ),
                              ),
                              Image.asset(
                                "assets/wash.png",
                                width: 140,
                                fit: BoxFit.fitWidth,
                                // alignment: Alignment.topCenter,
                              ),
                              Text(
                                "Clean your hands often. Use soap and water, or an alcohol-based hand rub.",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          height: 280,
                          width: 180,
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
                                "Wear Masks",
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                ),
                              ),
                              Image.asset(
                                "assets/mask.png",
                                width: 100,
                                fit: BoxFit.fitWidth,
                                // alignment: Alignment.topCenter,
                              ),
                              Text(
                                "Cover your mouth and nose when you cough and sneeze",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          height: 280,
                          width: 180,
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
                                "Social Distancing",
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                ),
                              ),
                              Image.asset(
                                "assets/distance.png",
                                width: 170,
                                fit: BoxFit.fitWidth,
                                // alignment: Alignment.topCenter,
                              ),
                              Text(
                                "Maintain a safe distance from anyone who is coughing or sneezing.",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.black),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Symptoms",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Container(
                  // width: double.infinity,
                  // child:
                  Container(
                    // scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // color: Colors.red,
                          // height: 100,
                          // width: 200,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/fever.png",
                                      width: 60,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Fever",
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 18.0,
                                              color: Colors.blue,
                                              fontStyle: FontStyle.normal),
                                        ),
                                        Text(
                                          "● Fever above 100ºC",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),

                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/caugh.png",
                                      width: 60,
                                      fit: BoxFit.fitWidth,
                                      // alignment: Alignment.topCenter,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Cough",
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 18.0,
                                              color: Colors.blue),
                                        ),
                                        Text(
                                          "● Dry cough occurs",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/headache.png",
                                      width: 60,
                                      fit: BoxFit.fitWidth,
                                      // alignment: Alignment.topCenter,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Headache",
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 18.0,
                                              color: Colors.blue),
                                        ),
                                        Text(
                                          "● Headache occurs",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/headache.png",
                                      width: 60,
                                      fit: BoxFit.fitWidth,
                                      // alignment: Alignment.topCenter,
                                    ),
                                    // SizedBox(
                                    //   width: 10.0,
                                    // ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Others",
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 18.0,
                                              color: Colors.blue),
                                        ),
                                        Text(
                                          "● aches and pains.\n● nasal congestion.\n● runny nose.\n● sore throat.\n● diarrhoea.",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                ],
              ),
            )
          ],
        ),
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
