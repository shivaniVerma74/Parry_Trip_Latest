class SearchTourCityResponse {
  int? total;
  int? totalPages;
  List<TourSerachDataList>? data;
  int? status;

  SearchTourCityResponse({this.total, this.totalPages, this.data, this.status});

  SearchTourCityResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <TourSerachDataList>[];
      json['data'].forEach((v) {
        data!.add(new TourSerachDataList.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class TourSerachDataList {
  int? id;
  String? title;
  String? image;
  Null? content;

  TourSerachDataList({this.id, this.title, this.image, this.content});

  TourSerachDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['content'] = this.content;
    return data;
  }
}
