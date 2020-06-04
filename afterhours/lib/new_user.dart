import 'package:afterhours/landing.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class NewUserPage extends StatefulWidget {
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
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
                  Text(
                      'Enter Your Email Address and Zip Code, and we will contact you about joining!',
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
                            labelText: 'Zip Code',
                            labelStyle: afterhoursWhiteStyle),
                      ),
                      FlatButton(
                        child: Text('SUBMIT', style: buttonBoldStyle),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyLandingApp()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    ));
  }
}
