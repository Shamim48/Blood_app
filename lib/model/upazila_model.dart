class UpazilaModel {
  UpazilaModel({
    required this.id,
    required this.districtId,
    required this.name,
    required this.bnName,
    required this.url,
  });
  late final String id;
  late final String districtId;
  late final String name;
  late final String bnName;
  late final String url;

  UpazilaModel.fromJson(Map<dynamic, dynamic> json){
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
    bnName = json['bn_name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['district_id'] = districtId;
    _data['name'] = name;
    _data['bn_name'] = bnName;
    _data['url'] = url;
    return _data;
  }

  @override
  String toString() {
    return 'UpazilaModel{id: $id, districtId: $districtId, name: $name, bnName: $bnName, url: $url}';
  }
}