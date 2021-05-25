import 'package:covid_nepal/view/Screen/InformationScreen.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final countryDetails;
  const SearchBar({Key key, this.countryDetails}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List countryNameList = [];
  String searchingRoute;

  @override
  void initState() {
    super.initState();
    widget.countryDetails.forEach((element) {
      countryNameList.add(element.country);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),

          // Search Bar
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: "Enter country name",
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      print("Search Button clicked");
                    },
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              onTap: () {
                setState(
                  () {
                    print("Search box tapped");
                    showSearch(
                      context: context,
                      delegate: RouteSearch(
                        recentCountryList: countryNameList,
                      ),
                    );
                  },
                );
              },
              readOnly: true,
            ),
          ),
        ),
      ],
    );
  }
}

class RouteSearch extends SearchDelegate<String> {
  List countries = [];
  List recentCountries = [
    "Nepal",
    "China",
    "Japan",
  ];

  String searchingRoute;
  String id;
  RouteSearch({List recentCountryList}) {
    countries = recentCountryList;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCountries
        : countries
            .where(
              (r) => r.toString().toLowerCase().contains(query),
            )
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = suggestionList[index].toString();
            close(context, query);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InformationScreen(
                      countryName: query.toString(),
                    )));
          },
          leading: Icon(Icons.directions_walk),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].toString(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCountries
        : countries
            .where(
              (r) => r.toString().toLowerCase().contains(query),
            )
            .toList();

    return suggestionList.isEmpty
        ? Text(
            'No results Found..',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        : ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  query = suggestionList[index].toString();
                  close(context, query);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InformationScreen(
                            countryName: query.toString(),
                          )));
                  showResults(context);
                },
                title: RichText(
                  text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    children: [
                      TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
