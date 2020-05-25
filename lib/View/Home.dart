import 'package:drone/View/Mapa.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drone View"),
        centerTitle: true,
        backgroundColor: Colors.teal,

      ),
      body: Container(
        child: Column(
          children: <Widget>[
            createTile(0,_selectedIndex,false, 'Mapa de Vôos', Colors.teal, Icons.map),
            createTile(1,_selectedIndex,true, 'Vôo Ao Vivo', Colors.teal, Icons.play_arrow),
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


}
