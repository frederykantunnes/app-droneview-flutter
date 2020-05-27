import 'package:drone/Model/FlightModel.dart';
import 'package:drone/Model/LiveModel.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlightAoVivo extends StatelessWidget {
  final LiveModel liveModel;
  final String url;
  YoutubePlayerController _controller;
  FlightAoVivo(this.liveModel, this.url){
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
        title: Text("Transmitindo"),
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
                      Text(liveModel.location, textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                      SizedBox(height: 10,),
                      Text("Drone ID: "+liveModel.droneId, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Text("Nome do Drone: "+liveModel.nameDrone, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

}