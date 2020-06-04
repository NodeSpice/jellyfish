import 'package:afterhours/reusable_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: afterBlue300,
          actions: <Widget>[
            IconButton(
                color: afterSurfaceGrey,
                icon: Icon(FontAwesomeIcons.userSecret),
                onPressed: () {}),
            Spacer(),
            Image.asset(
              'assets/img/logo3.png',
              height: 135.0,
              width: 130.0,
            ),
            Spacer(),
            IconButton(
                color: afterSurfaceGrey,
                icon: Icon(FontAwesomeIcons.map),
                onPressed: () {}),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(colour: afterBlue300),
                  ),
                  Expanded(
                    flex: 2,
                    child: ReusableCard(colour: afterBlue300),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(colour: afterBlue300),
                  ),
                  Expanded(
                    child: ReusableCard(colour: afterBlue300),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 3,
          backgroundColor: afterBlue900,
          height: 70.0,
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          items: <Widget>[
            Icon(
              FontAwesomeIcons.userCircle,
              size: 30,
              color: afterBlue900,
            ),
            Icon(
              FontAwesomeIcons.running,
              size: 30,
              color: afterBlue900,
            ),
            Icon(
              FontAwesomeIcons.calendarDay,
              size: 30,
              color: afterBlue900,
            ),
            Icon(
              FontAwesomeIcons.home,
              size: 35,
              color: afterBlue900,
            ),
            Icon(
              FontAwesomeIcons.calendarWeek,
              size: 30,
              color: afterBlue900,
            ),
            Icon(
              FontAwesomeIcons.store,
              size: 30,
              color: afterBlue900,
            ),
            Icon(
              FontAwesomeIcons.glassCheers,
              size: 30,
              color: afterBlue900,
            ),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
