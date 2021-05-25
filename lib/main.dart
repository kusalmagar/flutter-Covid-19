import 'package:covid_nepal/dependency_injector/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'view/Screen/information.dart';
import 'view/Screen/nepalInfoPage.dart';
import 'view/Screen/worldDataScreen.dart';

void main() {
  Injector.configure(Flavor.PROD);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData(brightness: Brightness.dark),
    home: MainUi(),
  ));
}

class MainUi extends StatefulWidget {
  @override
  _MainUiState createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  var navIndex = 0;
  final pages = List<Widget>.unmodifiable([
    WorldData(),
    CovidNepal(),
    InfromationPage(),
  ]);
  final iconList =
      List<IconData>.unmodifiable([Icons.public, Icons.home, Icons.info]);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Covid Info Nepal",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: pages[navIndex],
      bottomNavigationBar: MyNavBar(
          icons: iconList,
          onPressed: (i) => setState(() => navIndex = i),
          activeIndex: navIndex),
    );
  }
}

class MyNavBar extends StatefulWidget {
  const MyNavBar({
    @required this.icons,
    @required this.onPressed,
    @required this.activeIndex,
  }) : assert(icons != null);
  final List<IconData> icons;
  final Function(int) onPressed;
  final int activeIndex;
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    // IconData icons;
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.white, Colors.blue]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (var i = 0; i < widget.icons.length; i++)
            GestureDetector(
              child: Icon(
                widget.icons[i],
                color: i == widget.activeIndex
                    ? Colors.amber[900]
                    : Colors.black54,
              ),
              onTap: () => widget.onPressed(i),
            ),
        ],
      ),
    );
  }
}
