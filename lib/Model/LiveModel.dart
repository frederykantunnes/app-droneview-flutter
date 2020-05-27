
class LiveModel{

  static List<LiveModel> listLives;

  final String nameDrone;
  final String location;
  final String lat;
  final String long;
  final String dataTime;
  final String droneId;
  final String keyStreaming;
  final String urlStreaming;
  final String streamingId;


  LiveModel({this.nameDrone, this.location, this.lat, this.long, this.dataTime,
      this.droneId, this.keyStreaming, this.urlStreaming, this.streamingId});

  factory LiveModel.fromJson(Map<String, dynamic> json) {
    return LiveModel(
        nameDrone: json["nameDrone"],
        location: json["location"],
        lat: json['lat'],
        long: json['long'],
        dataTime: json["dataTime"],
        droneId: json['droneId'],
        keyStreaming: json['keyStreaming'],
        urlStreaming: json['urlStreaming'],
        streamingId: json['streamingId'],
    );
  }

}
