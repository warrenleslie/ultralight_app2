import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<String> Names = [
    'Gabriel','Warren','Fahim','Sarah', 'Jessica','George','Johnathan'
  ];
 


   void bitcoinShit()
   {
     
   }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
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
        resizeToAvoidBottomPadding: false,
        body: new Container(
        color: Color(0x99FFFFFF),
        child: new ListView.builder(
            reverse: false,
            itemBuilder: (_,int index)=>EachList(this.Names[index]),
            itemCount: this.Names.length,
        ),
      ),
    );
  }
}
class EachList extends StatelessWidget{
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      elevation: 14.0,
      child: new Container(
      padding: EdgeInsets.all(8.0),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(child: new Text(name[0]),),
          new Padding(padding: EdgeInsets.only(right: 10.0)),
          new Text(name,style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }
}