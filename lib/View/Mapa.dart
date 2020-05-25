import 'package:drone/View/PopUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';



class MapPage extends StatefulWidget {
//  final GlobalKey<_MapPageState> _mapPageStateKey = GlobalKey<_MapPageState>();
//  _mapPageStateKey
//  MapPage(GlobalKey<_MapPageState> key) : super(key: key);


  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static final List<LatLng> _points = [
    LatLng(-8.094833, -34.972750),
    LatLng(-8.069075, -34.922585),
    LatLng(-8.063413, -34.898923),
  ];

  static const _markerSize = 70.0;
  List<Marker> _markers;

  // Used to trigger showing/hiding of popups.
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    super.initState();

    _markers = _points
        .map(
          (LatLng point) => Marker(
        point: point,
        width: _markerSize,
        height: _markerSize,
        builder: (_) => Image.network("https://img.icons8.com/plasticine/2x/drone-with-camera.png" , height: _markerSize, width: _markerSize,),
//        builder: (_) => Icon(Icons.airplanemode_active, size: _markerSize),
        anchorPos: AnchorPos.align(AnchorAlign.top),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drone View - Vôos"),
        backgroundColor: Colors.teal,
      ),
        body: FlutterMap(
      options: new MapOptions(
        zoom: 12.0,
        center: _points.first,
        plugins: [PopupMarkerPlugin()],
        onTap: (_) => _popupLayerController
            .hidePopup(), // Hide popup when the map is tapped.
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        PopupMarkerLayerOptions(
          markers: _markers,
          popupSnap: PopupSnap.top,
          popupController: _popupLayerController,
          popupBuilder: (BuildContext _, Marker marker) => ExamplePopup(marker),
        ),
      ],
    ));
  }

  void showPopupForFirstMarker() {
    _popupLayerController.togglePopup(_markers.first);
  }
}