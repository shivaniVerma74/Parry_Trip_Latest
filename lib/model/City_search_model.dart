/// payload : [{"code":362658,"country_name":"UNITED STATES","name":"KAWAIAHA'O CHURCH","type":"POINT_OF_INTEREST","fullregionname":"KAWAIAHA'O CHURCH, HONOLULU, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"KAWAIAHA'O CHURCH","enabled":false},{"code":362659,"country_name":"UNITED STATES","name":"HONOLULU MUSEUM OF ART AT FIRST HAWAIIAN CENTER","type":"POINT_OF_INTEREST","fullregionname":"HONOLULU MUSEUM OF ART AT FIRST HAWAIIAN CENTER, HONOLULU, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"HONOLULU MUSEUM OF ART AT FIRST HAWAIIAN CENTER","enabled":false},{"code":362660,"country_name":"UNITED STATES","name":"OʻAHU MARKET","type":"POINT_OF_INTEREST","fullregionname":"OʻAHU MARKET, HONOLULU, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"OʻAHU MARKET","enabled":false},{"code":362661,"country_name":"UNITED STATES","name":"MAUNAKEA MARKETPLACE","type":"POINT_OF_INTEREST","fullregionname":"MAUNAKEA MARKETPLACE, HONOLULU, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"MAUNAKEA MARKETPLACE","enabled":false},{"code":362662,"country_name":"UNITED STATES","name":"KEKAULIKE MARKET","type":"POINT_OF_INTEREST","fullregionname":"KEKAULIKE MARKET, HONOLULU, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"KEKAULIKE MARKET","enabled":false},{"code":362663,"country_name":"UNITED STATES","name":"KUʻILIOLOA HEIAU","type":"POINT_OF_INTEREST","fullregionname":"KUʻILIOLOA HEIAU, WAIANAE, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"KUʻILIOLOA HEIAU","enabled":false},{"code":362664,"country_name":"UNITED STATES","name":"KAʻENA POINT STATE PARK","type":"POINT_OF_INTEREST","fullregionname":"KAʻENA POINT STATE PARK, WAIANAE, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"KAʻENA POINT STATE PARK","enabled":false},{"code":362665,"country_name":"UNITED STATES","name":"HOLE IN THE MOUNTAIN","type":"POINT_OF_INTEREST","fullregionname":"HOLE IN THE MOUNTAIN, ANAHOLA, HAWAII, UNITED STATES OF AMERICA","priority":0,"displayname":"HOLE IN THE MOUNTAIN","enabled":false},{"code":362666,"country_name":"UNITED STATES","name":"NOBBY CLARKE MANSION","type":"POINT_OF_INTEREST","fullregionname":"NOBBY CLARKE MANSION, SAN FRANCISCO, CALIFORNIA, UNITED STATES OF AMERICA","priority":0,"displayname":"NOBBY CLARKE MANSION","enabled":false},{"code":362667,"country_name":"UNITED STATES","name":"HUNTER S THOMPSON CRASH PAD","type":"POINT_OF_INTEREST","fullregionname":"HUNTER S THOMPSON CRASH PAD, SAN FRANCISCO, CALIFORNIA, UNITED STATES OF AMERICA","priority":0,"displayname":"HUNTER S THOMPSON CRASH PAD","enabled":false}]
/// status : {"success":true}

class CitySearchModel {
  CitySearchModel({
      List<Payload>? payload, 
      Status? status,}){
    _payload = payload;
    _status = status;
}

  CitySearchModel.fromJson(dynamic json) {
    if (json['payload'] != null) {
      _payload = [];
      json['payload'].forEach((v) {
        _payload?.add(Payload.fromJson(v));
      });
    }
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  List<Payload>? _payload;
  Status? _status;
CitySearchModel copyWith({  List<Payload>? payload,
  Status? status,
}) => CitySearchModel(  payload: payload ?? _payload,
  status: status ?? _status,
);
  List<Payload>? get payload => _payload;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_payload != null) {
      map['payload'] = _payload?.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }

}

/// success : true

class Status {
  Status({
      bool? success,}){
    _success = success;
}

  Status.fromJson(dynamic json) {
    _success = json['success'];
  }
  bool? _success;
Status copyWith({  bool? success,
}) => Status(  success: success ?? _success,
);
  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    return map;
  }

}

/// code : 362658
/// country_name : "UNITED STATES"
/// name : "KAWAIAHA'O CHURCH"
/// type : "POINT_OF_INTEREST"
/// fullregionname : "KAWAIAHA'O CHURCH, HONOLULU, HAWAII, UNITED STATES OF AMERICA"
/// priority : 0
/// displayname : "KAWAIAHA'O CHURCH"
/// enabled : false

class Payload {
  Payload({
      num? code, 
      String? countryName, 
      String? name, 
      String? type, 
      String? fullregionname, 
      num? priority, 
      String? displayname, 
      bool? enabled,}){
    _code = code;
    _countryName = countryName;
    _name = name;
    _type = type;
    _fullregionname = fullregionname;
    _priority = priority;
    _displayname = displayname;
    _enabled = enabled;
}

  Payload.fromJson(dynamic json) {
    _code = json['code'];
    _countryName = json['country_name'];
    _name = json['name'];
    _type = json['type'];
    _fullregionname = json['fullregionname'];
    _priority = json['priority'];
    _displayname = json['displayname'];
    _enabled = json['enabled'];
  }
  num? _code;
  String? _countryName;
  String? _name;
  String? _type;
  String? _fullregionname;
  num? _priority;
  String? _displayname;
  bool? _enabled;
Payload copyWith({  num? code,
  String? countryName,
  String? name,
  String? type,
  String? fullregionname,
  num? priority,
  String? displayname,
  bool? enabled,
}) => Payload(  code: code ?? _code,
  countryName: countryName ?? _countryName,
  name: name ?? _name,
  type: type ?? _type,
  fullregionname: fullregionname ?? _fullregionname,
  priority: priority ?? _priority,
  displayname: displayname ?? _displayname,
  enabled: enabled ?? _enabled,
);
  num? get code => _code;
  String? get countryName => _countryName;
  String? get name => _name;
  String? get type => _type;
  String? get fullregionname => _fullregionname;
  num? get priority => _priority;
  String? get displayname => _displayname;
  bool? get enabled => _enabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['country_name'] = _countryName;
    map['name'] = _name;
    map['type'] = _type;
    map['fullregionname'] = _fullregionname;
    map['priority'] = _priority;
    map['displayname'] = _displayname;
    map['enabled'] = _enabled;
    return map;
  }

}