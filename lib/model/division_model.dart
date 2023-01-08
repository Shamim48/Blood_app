class DivisionModel {
  DivisionModel({
    required this.id,
    required this.name,
    required this.bnName,
    required this.url,
  });
  late final String id;
  late final String name;
  late final String bnName;
  late final String url;

  DivisionModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    bnName = json['bn_name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['bn_name'] = bnName;
    _data['url'] = url;
    return _data;
  }
}