// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'colors.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/img/logo3.png',
                    height: 300,
                    width: 375,
                  ),
                  Text('Amazing Race', style: descriptionGreyStyle),
                  Text('Solve the Puzzle, Win the Race',
                      style: descriptionGreyStyle),
                ],
              ),
              SizedBox(height: 50.0),
              Builder(
                builder: (context) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                          decoration: InputDecoration(
                              fillColor: accColor,
                              labelText: 'Username',
                              labelStyle: afterhoursWhiteStyle)),
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: loColor,
                            labelText: 'Password',
                            labelStyle: afterhoursWhiteStyle),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL', style: buttonBoldStyle),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('NEXT', style: buttonBoldStyle),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              SignInButton(Buttons.Google, onPressed: () {
                Navigator.pop(context);
              }),
              SignInButton(Buttons.AppleDark, onPressed: () {
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.color0, this.child})
      : super(key: key);
  final Color color0;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          subhead: new TextStyle(color: color0),
        ),
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
