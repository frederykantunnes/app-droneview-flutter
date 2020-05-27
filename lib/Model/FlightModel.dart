import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class FlightModel{

  static List<FlightModel> listFlight;

  final String name;
  final String location;
  final String lat;
  final String long;
  final String dataTime;
  final String videoRGB;
  final String videoIR;
  final String droneId;
  final String droneName;
  final String pilotName;


  FlightModel({this.name, this.location, this.lat, this.long,
      this.dataTime, this.videoRGB, this.videoIR, this.droneId, this.droneName,
      this.pilotName});

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
        name: json["name"],
        location: json["location"],
        lat: json['lat'],
        long: json['long'],
        dataTime: json["dataTime"],
        videoRGB: json['videoRGB'],
        videoIR: json['videoIR'],
        droneId: json['droneId'],
        droneName: json['droneName'],
        pilotName: json['pilotName'],
    );
  }

  static List<LatLng> getListLat(){
    List<LatLng> _points = [];
    for (var i=0; i<FlightModel.listFlight.length; i++){
      _points.add(LatLng(double.parse(FlightModel.listFlight[i].lat), double.parse(FlightModel.listFlight[i].long)),);
    }
    return _points;
  }

  Future<FlightModel> getFlight(Marker marker) async{
    LatLng m;
    for (var i=0; i<FlightModel.listFlight.length; i++){
      m = LatLng(double.parse(FlightModel.listFlight[i].lat), double.parse(FlightModel.listFlight[i].long));
      if(m == marker.point){
        return FlightModel.listFlight[i];
      }
    }
  }

}
