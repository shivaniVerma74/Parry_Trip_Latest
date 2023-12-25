class SeatInfoModel1 {
  SData? sData;
  List<SInfo>? sInfo;

  SeatInfoModel1({this.sData, this.sInfo});

  SeatInfoModel1.fromJson(Map<String, dynamic> json) {
    sData = json['sData'] != null ? new SData.fromJson(json['sData']) : null;
    if (json['sInfo'] != null) {
      sInfo = <SInfo>[];
      json['sInfo'].forEach((v) {
        sInfo!.add(new SInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sData != null) {
      data['sData'] = this.sData!.toJson();
    }
    if (this.sInfo != null) {
      data['sInfo'] = this.sInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SData {
  int? row;
  int? column;

  SData({this.row, this.column});

  SData.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['column'] = this.column;
    return data;
  }
}

class SInfo {
  String? seatNo;
  SData? seatPosition;
  bool? isBooked;
  String? key1;
  String? code;
  String? amount;
  String? desc;
  bool? isAisle;
  bool? isLegroom;
  bool? selected;

  SInfo(
      {this.seatNo,this.selected,
        this.seatPosition,
        this.isBooked,
        this.key1,
        this.code,
        this.amount,
        this.desc,
        this.isAisle,
        this.isLegroom});

  SInfo.fromJson(Map<String, dynamic> json) {
    seatNo = json['seatNo'];
    seatPosition = json['seatPosition'] != null
        ? new SData.fromJson(json['seatPosition'])
        : null;
    isBooked = json['isBooked'];
    key1 = json['key'];
    selected = false;
    code = json['code'];
    amount = json['amount'].toString();
    desc = json['desc'];
    isAisle = json['isAisle'];
    isLegroom = json['isLegroom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seatNo'] = this.seatNo;
    if (this.seatPosition != null) {
      data['seatPosition'] = this.seatPosition!.toJson();
    }
    data['isBooked'] = this.isBooked;
    data['key'] = this.key1;
    data['code'] = this.code;
    data['amount'] = this.amount;
    data['desc'] = this.desc;
    data['isAisle'] = this.isAisle;
    data['isLegroom'] = this.isLegroom;
    return data;
  }
}
