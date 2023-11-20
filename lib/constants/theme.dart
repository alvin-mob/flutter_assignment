import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const normalScreenPaddingSize = 20.0;
const normalWidgetPaddingSize = 10.0;
const normalScreenPadding =
EdgeInsets.symmetric(horizontal: normalScreenPaddingSize);
const normalBorderRadiusSize = 6.0;
const normalWidgetPadding =
EdgeInsets.all(normalWidgetPaddingSize);
const fontSizeHeading1 = 26.0;
const fontSizeHeading2 = 16.0;
const fontSizeTitle1 = 14.0;
const fontSizeTitle2 = 12.0;
const fontSizeTitle3 = 12.0;


class CustomTheme{

  static const primaryColor = Colors.red;
  static const backgroundColor = Color(0xfffafafa);
  static const backgroundWhite = Colors.white;
  static const buttonColor = Color(0xff232D3F);
  static var textStyleHeading1 = GoogleFonts.openSans(
    fontSize: fontSizeHeading1,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
  static var textStyleHeading2 = GoogleFonts.openSans(
    fontSize: fontSizeHeading2,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
  static var textStyleTitle1 = GoogleFonts.openSans(
    fontSize: fontSizeTitle1,
    //color: Colors.black,
    //fontWeight: FontWeight.bold
  );
  static var textStyleTitle2 = GoogleFonts.openSans(
    fontSize: fontSizeTitle2,
    //color: Colors.black,
    //fontWeight: FontWeight.bold
  );
}