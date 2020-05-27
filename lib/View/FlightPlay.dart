import 'package:drone/Model/FlightModel.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlightPlay extends StatelessWidget {
  final FlightModel flightModel;
  final String url;
  YoutubePlayerController _controller;
  FlightPlay(this.flightModel, this.url){
    _controller = YoutubePlayerController(
      initialVideoId: url,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
//        controlsVisibleAtStart: false,
//        hideControls: true,
        hideThumbnail: true,
        disableDragSeek: true,
      ),
    );
  }
  var iconPlay = Icons.play_arrow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vôo Gravado"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: (
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(flightModel.name, textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      Text("Data do Vôo: "+flightModel.dataTime, textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                      SizedBox(height: 10,),
                      Text(isRGB()?"Video RGB":"Vídeo IR", textAlign: TextAlign.justify, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                      SizedBox(height: 10,),
                      Text("Local: "+flightModel.location, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Text("Drone ID: "+flightModel.droneId, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Text("Nome do Drone: "+flightModel.droneName, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Piloto: "+flightModel.pilotName, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
                    ],
                  )
              ),
            ),
            SizedBox(
              height: 30,
            ),
            isRGB()?RaisedButton(
              color: Colors.redAccent,
              child: Text("Ver Video Infravermelho", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightPlay(flightModel, flightModel.videoIR)));
              },
            ):RaisedButton(
              color: Colors.redAccent,
              child: Text("Ver Video RGB", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightPlay(flightModel, flightModel.videoRGB)));
              },
            )
          ],
        ),
      ),
    );
  }
  bool isRGB(){
    if (url == flightModel.videoRGB){
      return true;
    }
    return false;
  }
}