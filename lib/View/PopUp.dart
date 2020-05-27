import 'package:drone/View/FlightPlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../Model/FlightModel.dart';

class ExamplePopup extends StatefulWidget {
  final Marker marker;

  ExamplePopup(this.marker, {Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ExamplePopupState(this.marker);
}

class _ExamplePopupState extends State<ExamplePopup> {
  final Marker _marker;

  FlightModel flightModel;
  final List<IconData> _icons = [
    Icons.star_border,
    Icons.star_half,
    Icons.star
  ];
  int _currentIcon = 0;

  _ExamplePopupState(this._marker);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child:FutureBuilder(
//                    future: FlightModel().getFlight(_marker),
            future: FlightModel().getFlight(_marker),
            builder: (context, projectSnap) {
              if (projectSnap.data == null) {
                return CircularProgressIndicator();
              }
              return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //            Padding(
                    //              padding: EdgeInsets.only(left: 20, right: 10),
                    //              child: Icon(_icons[_currentIcon]),
                    //            ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: FloatingActionButton(
                        backgroundColor: Colors.redAccent,
                        child: Icon(Icons.play_arrow),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightPlay(projectSnap.data, projectSnap.data.videoRGB)));
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            constraints: BoxConstraints(
                                minWidth: 100, maxWidth: 200),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    projectSnap.data.name,
                                    //                        _flightModel.name,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.symmetric(
                                      vertical: 4.0)),
                                  Text(
                                    //              "Position: ${_marker.point.latitude}, ${_marker.point.longitude}",
                                    projectSnap.data.location,
                                    style: const TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    projectSnap.data.droneName,
                                    style: const TextStyle(
                                        fontSize: 12.0),
                                  ),
                                  Text(
                                    projectSnap.data.dataTime,
                                    style: const TextStyle(
                                        fontSize: 12.0),
                                  ),

                                  Text(
                                    projectSnap.data.pilotName,
                                    style: const TextStyle(
                                        fontSize: 12.0),
                                  ),
                                  //            Text(
                                  //              "Marker size: ${_marker.width}, ${_marker.height}",
                                  //              style: const TextStyle(fontSize: 12.0),
                                  //            ),
                                ]
                            )
                        )
                    ),
                  ]
              );
            }
        ),
      )
    );
  }
}