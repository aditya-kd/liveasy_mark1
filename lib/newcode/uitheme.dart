import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
ThemeData basicTheme() {
  return ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[900],
      // Define the default font family.
      fontFamily: 'Georgia',
      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ));
}

var myBtnStyle = ElevatedButton.styleFrom(
    primary: basicTheme().primaryColor,
    padding: const EdgeInsets.all(8.0),
    textStyle: const TextStyle(fontSize: 16));
    

var myHeadlineStyle = GoogleFonts.roboto(textStyle: const 
TextStyle(color: Colors.black,
fontWeight:  FontWeight.w700, 
fontSize: 20,
));

var mySubHeadingStyle = GoogleFonts.roboto(textStyle: const
TextStyle( color: Colors.black, 
fontWeight: FontWeight.normal,
fontSize: 14));
