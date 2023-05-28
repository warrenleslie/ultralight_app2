import 'package:flutter/material.dart';
import 'package:ultralight_app/HomePage.dart';
import 'package:ultralight_app/Prediction.dart';
import 'package:ultralight_app/Transaction.dart';
import 'package:ultralight_app/Stats.dart';
import 'package:ultralight_app/pages/welcome_page.dart';


void main() {
  runApp(
    MaterialApp(
       debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget  {
  _MyAppState createState() =>_MyAppState();
}

class _MyAppState extends State<MyApp>  {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      ()  {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => WelcomePage(),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Center(
        child: Image(
          height: 300,
          width: 300,
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/logos.png'),
        ),
      ),
    );
  }
}


class ultralight extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
  return new MaterialApp(
    home: new WelcomePage()
    );
  }
}


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
  
 {

   int _currentIndex=0;
   final List<Widget>_children=[
     Transaction(),
     HomePage(),
     Prediction(),
     statisticsPage(),
   ];

   void onTappedBar(int index)
   {
     setState(() {
       _currentIndex=index;
     });
   }

  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      body: _children[_currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items:
        [
          BottomNavigationBarItem
          (
          icon: new Icon(Icons.attach_money),
          backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
          title:new Text('Transaction')
          ),
          //transaction
          BottomNavigationBarItem
          (
          icon: new Icon(Icons.home),
          backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
          title:new Text('Home')
          ),
          //home
          BottomNavigationBarItem
          (
          icon: new Icon(Icons.multiline_chart),
          backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
          title:new Text('Prediction')
          ),
          //graph
          BottomNavigationBarItem
          (
          icon: new Icon(Icons.table_chart),
          backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
          title:new Text('Stats')
          )
          //statistics
        ],
      ),
    );
  }
}