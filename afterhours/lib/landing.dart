import 'dart:math';

import 'package:afterhours/colors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyLandingApp extends StatefulWidget {
  @override
  _MyLandingAppState createState() => _MyLandingAppState();
}

class _MyLandingAppState extends State<MyLandingApp> {
  int page = 0;

  UpdateType updateType;

  final pages = <Widget>[
    LandingSlide(
      imgURL: 'assets/ani/1stCongrats.flr',
      txt1: 'Join Now',
      txt2: 'Amazing Race',
      txt3:
          'Battle against your friends and neighbors in weekly city-wide scavenger hunt.',
      animation: "yay",
      colour: Colors.red[200],
      textDecoration1: whiteStyle,
      textDecoration2: descriptionWhiteStyle,
    ),
    LandingSlide(
      imgURL: 'assets/ani/coding.flr',
      txt1: 'Join Now',
      txt2: 'Amazing Race',
      txt3:
          'Battle against your friends and neighbors in weekly city-wide scavenger hunt.',
      animation: "coding",
      colour: Colors.white,
      textDecoration1: greyStyle,
      textDecoration2: descriptionGreyStyle,
    ),
    LandingSlide(
      imgURL: 'assets/ani/swing.flr',
      txt1: 'Enjoy Friendly',
      txt2: 'Competition',
      txt3:
          'Be the first to solve the clues to capture points and rise on the leaderboard.',
      animation: "Swing",
      colour: Colors.yellow[300],
      textDecoration1: greyStyle,
      textDecoration2: descriptionGreyStyle,
    ),
    LandingSlide(
      imgURL: 'assets/ani/1stCongrats.flr',
      txt1: 'Earn Points',
      txt2: 'Shopping Spree',
      txt3: 'Use your prize points to buy gear or attend exclusive events!',
      animation: "yay",
      colour: Colors.lightBlue[100],
      textDecoration1: whiteStyle,
      textDecoration2: descriptionGreyStyle,
    ),
    LandingSlide(
      imgURL: 'assets/ani/coding.flr',
      txt1: 'Sign Up',
      txt2: 'Today',
      txt3:
          'Make an account today. If a race is available in your area, we will let you know!',
      animation: "coding",
      colour: Colors.purple[50],
      textDecoration1: greyStyle,
      textDecoration2: descriptionGreyStyle,
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            fullTransitionValue: 500,
            enableSlideIcon: true,
            enableLoop: true,
            positionSlideIcon: 0.5,
            onPageChangeCallback: pageChangeCallback,
            currentUpdateTypeCallback: updateTypeCallback,
            waveType: WaveType.liquidReveal,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(5, _buildDot),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text("SIGN UP", style: afterhoursBlackStyle),
                  onPressed: () {
                    Navigator.pushNamed(context, '/new');
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => LoginPage()));
                  },
                ),
                FlatButton(
                  child: Text("LOGIN", style: afterhoursBlackStyle),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => LoginPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    print(lpage);
    setState(() {
      page = lpage;
    });
  }

  updateTypeCallback(UpdateType updateType) {
    print(updateType);
  }
}

class LandingSlide extends StatelessWidget {
  LandingSlide(
      {@required this.imgURL,
      @required this.txt1,
      @required this.txt2,
      @required this.txt3,
      @required this.colour,
      @required this.animation,
      @required this.textDecoration1,
      @required this.textDecoration2});
  final String imgURL;
  final String txt1;
  final String txt2;
  final String txt3;
  final String animation;
  final Color colour;
  final TextStyle textDecoration1;
  final TextStyle textDecoration2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colour,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: new FlareActor(imgURL,
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: animation),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  txt1,
                  style: textDecoration1,
                ),
                Text(
                  txt2,
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  txt3,
                  style: textDecoration2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
