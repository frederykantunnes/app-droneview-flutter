import 'dart:io';

import 'package:flutter/material.dart';


class SemInternet extends StatefulWidget {
  @override
  _SemInternetState createState() => _SemInternetState();
}

class _SemInternetState extends State<SemInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.signal_wifi_off, size: 100, color: Colors.white,),
            Text("Desconectado!", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),),
            SizedBox(height: 20,),
            Text("Desculpe, mas não conseguimos conectar com nossa base de dados, verifique sua conexão e tente novamente!", textAlign: TextAlign.justify, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.exit_to_app),
        onPressed: (){
          exit(0);
        },
      ),
    );
  }
}
