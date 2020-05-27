import 'package:drone/Controller/API.dart';
import 'package:drone/Model/FlightModel.dart';
import 'package:drone/Model/LiveModel.dart';
import 'package:drone/View/FlightAoVivo.dart';
import 'package:drone/View/Mapa.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var voos = false;
  var aovivo = false;
  @override
  Widget build(BuildContext context) {
    fetchData().then((value){
      if(value == true){
        if (FlightModel.listFlight.length>0){
          setState(() {
            voos=true;
          });
        }
        if (LiveModel.listLives.length>0){
          setState(() {
            aovivo=true;
          });
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Drone View"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            flightExists()?createTile(0,_selectedIndex,false, 'Mapa de Vôos', Colors.blue, Icons.map):Padding( padding: EdgeInsets.all(20), child: Text("Nenhum Vôo Gravado", style: TextStyle(fontSize: 20,),),),
            liveExists()?createTile(1,_selectedIndex,true, 'Vôo Ao Vivo', Colors.blue, Icons.play_arrow):Padding( padding: EdgeInsets.all(20), child: Text("Nenhum Vôo Aovivo", style: TextStyle(fontSize: 20,),),),
          ],
        ),
      ),
    );
  }

  int _selectedIndex = -1;
  Widget createTile(int index,int selectedIndex,bool isEven, String title, Color color, IconData icon) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: (){
            switch(index){
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MapPage()));
                break;
              case 1:
                liveExists()?Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightAoVivo(LiveModel.listLives[0], LiveModel.listLives[0].streamingId))):null;
                break;
            }
          },
          child: Material(
            elevation: 1.0,
            color: _selectedIndex==index?Colors.lightBlueAccent:Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 30,bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(icon,color: _selectedIndex==index?Colors.white:color, size: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex==index?Colors.white:Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:2.0),
                        child: Container(
                          height: 3.0,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: _selectedIndex==index?Colors.white:color,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  bool flightExists(){
    if(FlightModel.listFlight != null){
      if(FlightModel.listFlight.length>0){
        return true;
      }
      return false;
    }
    return false;
  }
  bool liveExists(){
    if(LiveModel.listLives != null){
      if(LiveModel.listLives.length>0){
        return true;
      }
      return false;
    }
    return false;
  }
}
