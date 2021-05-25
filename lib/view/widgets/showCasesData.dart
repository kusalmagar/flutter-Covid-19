import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget showCasesData(String title, String data, Color textColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 15.0,
          color: textColor,
        ),
      ),
      Text(
        data,
        style: TextStyle(
          fontSize: 15.0,
          color: textColor,
        ),
      ),
    ],
  );
}

Widget countryInnfo(
    String countryName, String flag, Color textColor, FontWeight fontWeight) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.network(
        flag,
        height: 30.0,
        width: 30.0,
      ),
      Text(
        countryName,
        style: TextStyle(
          color: textColor,
          fontSize: 15.0,
          fontWeight: fontWeight,
        ),
      ),
    ],
  );
}
