class DistricsModel {
  DistricsModel({
    required this.id,
    required this.divisionId,
    required this.name,
    required this.bnName,
    required this.lat,
    required this.lon,
    required this.url,
  });
  late final String id;
  late final String divisionId;
  late final String name;
  late final String bnName;
  late final String lat;
  late final String lon;
  late final String url;

  DistricsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    divisionId = json['division_id'];
    name = json['name'];
    bnName = json['bn_name'];
    lat = json['lat'];
    lon = json['lon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['division_id'] = divisionId;
    _data['name'] = name;
    _data['bn_name'] = bnName;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['url'] = url;
    return _data;
  }
}