import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class statisticsPage extends StatefulWidget {
  @override
  _statisticsPageState createState() => _statisticsPageState();
}

class _statisticsPageState extends State<statisticsPage> {
  int btcLastHour=0;
  int nrTransaction=0;
  int contactsOnline=0;
  int timeLastTrans=0;

    Material myTextItems(String title, String priceVal,){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
               children: <Widget>[

                  Padding(
                   padding: EdgeInsets.all(8.0),
                      child:Text(title,style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),),
                    ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),

               ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material myCircularItems(String title, String priceVal,){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),

              
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material mychart1Items(String title, String priceVal,) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body:Container(
          color:Color(0xffE5E5E5),
          child:StaggeredGridView.count(              // Creates a scrollable, 2D array of widgets of variable sizes.
            crossAxisCount: 4,
           crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),               
            child: mychart1Items("Pending","0.0s",),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myTextItems("Confirmed","null"),
          ),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("Fees","null"),         
          ),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("Users","null"),   
          ),
  
        ],
        staggeredTiles: [                           // Fixed number of tiles in the cross axis.
          StaggeredTile.extent(4, 250.0),
          StaggeredTile.extent(2, 250.0),
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(2, 120.0),
        ],
      ),
      ),
    );
  }
}