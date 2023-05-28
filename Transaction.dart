import 'package:flutter/material.dart';
import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:blockcypher/blockcypher.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'package:dio/dio.dart';

//setup contoller
TextEditingController amountController = new TextEditingController();
TextEditingController contactController = new TextEditingController();

//here we set up the wallet for current user
HDWallet myWallet()
{
  var seed = bip39.mnemonicToSeed(randomString(10));
  HDWallet hdWallet = new HDWallet.fromSeed(seed);
  return hdWallet;
}
var address = myWallet().address;
var pubkey = myWallet().pubKey;
var privkey = myWallet().pubKey;
var wif = myWallet().wif;
var amount = 0;

  //add transaction and sign it 
String signedTransaction()
{    
  final user = ECPair.fromWIF(wif);    
  final txb = new TransactionBuilder();
  txb.setVersion(1);
  txb.addInput('custom previous transaction id ', 0);
  txb.addOutput('custom  output', 12000);
  // (in)15000 - (out)12000 = (fee)3000, this is the miner fee
  txb.sign( 0, user);
  String signedTXID= txb.build().toHex();
  return signedTXID;
}
  
void send(String hexTXID) async
{
  try 
  {
    Response response = await Dio().post("https://api.blockcypher.com/v1/bcy/test/txs/push?token=2ed89931b3fe43a2bd52d630bff3e2bb", data: {hexTXID});
    print(response);
  } 
  catch (e) 
  {
    print(e);
  }
}

void recieve(String addrTo,String addrFrom , double ammount)
{
    
}

//setup front end
class Transaction extends StatefulWidget 
{
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
 

  Widget _getText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 24.0),
      child: Text(text),
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
      resizeToAvoidBottomPadding: false,
        body: new Container(     
        color: Color(0xFFFFFFFF), 
        padding: new EdgeInsets.all(18.0),
        child: new Center(
          child: new Column(
            children: <Widget>
            [
               Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: new BorderRadius.circular(24.0),
                shadowColor: new Color(0x802196F3),
                child: new Container(
                padding: new EdgeInsets.all(10.0),
                  child: new Column(
                    children: <Widget>[
                     _getText(
                      'Here we setup the wallet for current user'
                    ),
                        new Text('Warren',style: TextStyle( color:Colors.black,fontSize: 20.0)),
                        new Text('$amount BTC',style: TextStyle( color:Colors.black,fontSize: 30.0)),
                        new TextField(
                          controller: amountController,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Amount:~',
                            hintStyle: TextStyle(color: Colors.black)
                          ),
                        ),
                        new TextField(
                          controller: contactController,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Contact:~ ',             
                            hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: new BorderRadius.circular(24.0),
                shadowColor: new Color(0x802196F3),
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new SelectableText('Address $address',textAlign:TextAlign.center,style: TextStyle(color:Colors.black, fontSize: 20.0)),
                    ],
                  ),
                ),
              ),
               Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: new BorderRadius.circular(24.0),
                shadowColor: new Color(0x802196F3),
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                    buttonGrp()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buttonGrp extends StatefulWidget {
  @override
  _buttonGrpState createState() => _buttonGrpState();
}

class _buttonGrpState extends State<buttonGrp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row
        (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          //this is the send button
          FlatButton(
          color: Color(0xFFF44336),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          ),
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(2.0),
          splashColor: Color(0xFFF44336),
          onPressed: () 
          {
           var amount = amountController.text;
           new Text(amount);
           send(signedTransaction());
          },
            child: Text(
            "Send",
            style: TextStyle(fontSize: 20.0),
          ),
        ),

        //This is the Request 
          FlatButton(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),),
          color: Color(0xFFF44336),
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(2.0),
          splashColor: Color(0xFFF44336),
          onPressed: () 
          {
            /*...*/
           //recieve("client adress");         
          },
            child: Text(
              "Request",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}

ListTile myRowDataIcon(IconData iconVal, String rowVal) {
  return ListTile(
    leading: Icon(iconVal,
        color: new Color(0xffffffff)),
    title: Text(rowVal, style: TextStyle(
      color: Colors.white,
    ),),
  );
}