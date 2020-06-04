import 'package:afterhours/colors.dart';
import 'package:afterhours/home.dart';
import 'package:afterhours/landing.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'new_user.dart';

class AfterHoursApp extends StatefulWidget {
  @override
  _AfterHoursAppState createState() => _AfterHoursAppState();
}

class _AfterHoursAppState extends State<AfterHoursApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazing Race',
        theme: _afterHoursTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyLandingApp(),
          '/login': (context) => LoginPage(),
          '/new': (context) => NewUserPage(),
          '/home': (context) => HomePage()
        });
  }
}

final ThemeData _afterHoursTheme = _buildafterHoursTheme();

ThemeData _buildafterHoursTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: weirdRed500,
    primaryColor: afterBlue900,

    scaffoldBackgroundColor: afterBlue900,
    cardColor: afterSurfaceLightGrey,
    textSelectionColor: afterRed100,
    errorColor: afterErrorRed,

    //  text themes
    textTheme: _buildAfterHoursTextTheme(base.textTheme),
    primaryTextTheme: _buildAfterHoursTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildAfterHoursTextTheme(base.accentTextTheme),
    // icon themes
    primaryIconTheme: base.iconTheme.copyWith(color: afterBlue900),
    // the inputs curve

    // inputDecorationTheme: InputDecorationTheme(border: CutCornersBorder()),
  );
}

//  AfterHours Text Theme
TextTheme _buildAfterHoursTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineSurfaceWhite,
        bodyColor: kShrineSurfaceWhite,
      );
}
