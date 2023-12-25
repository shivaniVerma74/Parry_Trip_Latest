class TrendingTourismResponse {
  String? type;
  String? name;
  Model? model;
  String? component;
  bool? open;
  bool? isContainer;

  TrendingTourismResponse(
      {this.type,
        this.name,
        this.model,
        this.component,
        this.open,
        this.isContainer});

  TrendingTourismResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    model = json['model'] != null ? new Model.fromJson(json['model']) : null;
    component = json['component'];
    open = json['open'];
    isContainer = json['is_container'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    if (this.model != null) {
      data['model'] = this.model!.toJson();
    }
    data['component'] = this.component;
    data['open'] = this.open;
    data['is_container'] = this.isContainer;
    return data;
  }
}

class Model {
  String? title;
  String? desc;
  int? number;
  String? style;
  String? categoryId;
  String? locationId;
  String? order;
  String? orderBy;
  String? isFeatured;
  List <dynamic>? customIds;
  List<TourismData>? data;

  Model(
      {this.title,
        this.desc,
        this.number,
        this.style,
        this.categoryId,
        this.locationId,
        this.order,
        this.orderBy,
        this.isFeatured,
        this.customIds,
        this.data});

  Model.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    number = json['number'];
    style = json['style'];
    categoryId = json['category_id'];
    locationId = json['location_id'];
    order = json['order'];
    orderBy = json['order_by'];
    isFeatured = json['is_featured'];
    customIds = json['custom_ids'];
    if (json['data'] != null) {
      data = <TourismData>[];
      json['data'].forEach((v) {
        data!.add(new TourismData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['number'] = this.number;
    data['style'] = this.style;
    data['category_id'] = this.categoryId;
    data['location_id'] = this.locationId;
    data['order'] = this.order;
    data['order_by'] = this.orderBy;
    data['is_featured'] = this.isFeatured;
    data['custom_ids'] = this.customIds;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourismData {
  int? id;
  String? objectModel;
  String? title;
  String? price;
  String? salePrice;
  String? discountPercent;
  String? image;
  String? content;
  Location? location;
  int? isFeatured;
  String? duration;
  String? slug;
  ReviewScore? reviewScore;

  TourismData(
      {this.id,
        this.objectModel,
        this.title,
        this.price,
        this.salePrice,
        this.discountPercent,
        this.image,
        this.content,
        this.slug,
        this.location,
        this.isFeatured,
        this.duration,
        this.reviewScore});

  TourismData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectModel = json['object_model'];
    title = json['title'];
    price = json['price'];
    slug = json['slug'];
    salePrice = json['sale_price'];
    discountPercent = json['discount_percent'];
    image = json['image'];
    content = json['content'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    isFeatured = json['is_featured'];
    duration = json['duration'];
    reviewScore = json['review_score'] != null
        ? new ReviewScore.fromJson(json['review_score'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object_model'] = this.objectModel;
    data['title'] = this.title;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['discount_percent'] = this.discountPercent;
    data['image'] = this.image;
    data['content'] = this.content;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['is_featured'] = this.isFeatured;
    data['duration'] = this.duration;
    if (this.reviewScore != null) {
      data['review_score'] = this.reviewScore!.toJson();
    }
    return data;
  }
}

class Location {
  int? id;
  String? name;

  Location({this.id, this.name});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ReviewScore {
  String? scoreTotal;
  int? totalReview;

  ReviewScore({this.scoreTotal, this.totalReview});

  ReviewScore.fromJson(Map<String, dynamic> json) {
    scoreTotal = json['score_total'];
    totalReview = json['total_review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score_total'] = this.scoreTotal;
    data['total_review'] = this.totalReview;
    return data;
  }
}
