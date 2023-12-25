/// data : [{"id":"9252","title":" Bharuch (bypass)"},{"id":"16347","title":" Model Colony,Nashik"},{"id":"16537","title":" Mumbai Naka,Nashik"},{"id":"15949","title":"(Area)Dadar.,Mumbai"},{"id":"16914","title":"26 Bb, Rajasthan"},{"id":"5271","title":"26th Mile(kerala)"},{"id":"16880","title":"29BB, Rajasthan"},{"id":"1931","title":"A K Pora"},{"id":"16133","title":"A P M C,Ahmedabad"},{"id":"5392","title":"A.i .area"},{"id":"3644","title":"A.konduru"},{"id":"25","title":"A.r.t.c. Diphu"},{"id":"5451","title":"A.S.Peta"},{"id":"8183","title":"Aachara"},{"id":"3000","title":"Aade(maharashtra)"},{"id":"10670","title":"Aadivare"},{"id":"7390","title":"Aadsar"},{"id":"7954","title":"Aamaran"},{"id":"10170","title":"Aambala (Gujarat)"},{"id":"16896","title":"Aandhi, Rajasthan"}]
/// status : 1

class BusSearchModel {
  BusSearchModel({
      List<SearchData>? data,
      num? status,}){
    _data = data;
    _status = status;
}

  BusSearchModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SearchData.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<SearchData>? _data;
  num? _status;
BusSearchModel copyWith({  List<SearchData>? data,
  num? status,
}) => BusSearchModel(  data: data ?? _data,
  status: status ?? _status,
);
  List<SearchData>? get data => _data;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : "9252"
/// title : " Bharuch (bypass)"

class SearchData {
  SearchData({
      String? id, 
      String? title,}){
    _id = id;
    _title = title;
}

  SearchData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  String? _id;
  String? _title;
SearchData copyWith({  String? id,
  String? title,
}) => SearchData(  id: id ?? _id,
  title: title ?? _title,
);
  String? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}