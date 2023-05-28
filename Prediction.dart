import 'package:flutter/material.dart';
import 'package:bip32/bip32.dart';

class Prediction extends StatefulWidget {
  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: new AppBar(
        centerTitle: true,
         title: Row(
           mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
            'assets/logos.png',
            fit: BoxFit.contain,
            height: 60,
            width: 60,
            ),
          ],
        ),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
        ),
      body: Center(
            child: Text(
              'Underdevelopment', 
            style:TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}