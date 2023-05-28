import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ultralight_app/pages/register_page.dart';
import 'package:ultralight_app/pages/settings.dart';
import 'package:ultralight_app/pages/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';


class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  FirebaseUser user;
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Ultralight Beam', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25.0)),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            RaisedButton(
              onPressed: () => _pushPage(context, RegisterPage()),
              child: const Text('Register',
              style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16),
              ),
            ),
            RaisedButton(
              onPressed: () => _pushPage(context, SignInPage()),
              child: const Text('Sign in',
              style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16),
                ),
            ),
             Container(
               padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () => _pushPage(context, Settings()),
              child: const Text(
                'Settings',
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16),
                  ),
            ),
          ),
            ],
          ),
        );
      }      
    


  void _pushPage(BuildContext context, Widget page) {   // Push the given route onto the navigator.
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}