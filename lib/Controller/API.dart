import 'dart:async';
import 'dart:convert';
import 'package:drone/Model/FlightModel.dart';
import 'package:drone/Model/LiveModel.dart';
import 'package:http/http.dart' as http;

  Future<bool> fetchData() async {
//    final response = await http.get("http://www.mocky.io/v2/5ecd365a32000061002367f4");
    final response = await http.get("http://www.mocky.io/v2/5ecda1063000004f00ea0ba6");
    if (response.statusCode == 200) {
      Iterable lives = json.decode(response.body)["contentLives"];
      Iterable flights = json.decode(response.body)["contentFlights"];
      FlightModel.listFlight = flights.map((i)=> FlightModel.fromJson(i)).toList();
      LiveModel.listLives = lives.map((i)=> LiveModel.fromJson(i)).toList();
      return true;
    } else {
      return false;
    }
  }