class TourLocationMarkerResponse {
  List<Markers>? markers;
  List<Rows>? rows;

  TourLocationMarkerResponse({this.markers,this.rows});

  TourLocationMarkerResponse.fromJson(Map<String, dynamic> json) {
    if (json['markers'] != null) {
      markers = <Markers>[];
      json['markers'].forEach((v) {
        markers!.add(new Markers.fromJson(v));
      });
    }
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.markers != null) {
      data['markers'] = this.markers!.map((v) => v.toJson()).toList();
    }
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Markers {
  int? id;
  String? title;
  double? lat;
  double? lng;
  List<Gallery>? gallery;
  String? infobox;
  String? marker;

  Markers(
      {this.id,
        this.title,
        this.lat,
        this.lng,
        this.gallery,
        this.infobox,
        this.marker});

  Markers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lat = json['lat'];
    lng = json['lng'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    infobox = json['infobox'];
    marker = json['marker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    data['infobox'] = this.infobox;
    data['marker'] = this.marker;
    return data;
  }
}

class Gallery {
  String? large;
  String? thumb;

  Gallery({this.large, this.thumb});

  Gallery.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Rows {
  int? id;
  String? title;
  String? slug;
  String? content;
  List<ImageId>? imageId;
  int? bannerImageId;
  String? shortDesc;
  int? categoryId;
  int? locationId;
  String? address;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  int? isFeatured;
  String? gallery;
  String? video;
  String? price;
  String? salePrice;
  int? duration;
  int? minPeople;
  int? maxPeople;
  List<Faqs>? faqs;
  String? status;
  String? publishDate;
  String? createUser;
  String? updateUser;
  String? deletedAt;
  String? originId;
  String? lang;
  String? createdAt;
  String? updatedAt;
  int? defaultState;
  int? enableFixedDate;
  String? startDate;
  String? endDate;
  String? lastBookingDate;
  List<Include>? include;
  List<Include>? exclude;
  List<Itinerary>? itinerary;
  String? reviewScore;
  String? icalImportUrl;
  String? enableServiceFee;
  String? serviceFee;
  String? surrounding;
  String? dateFormTo;
  String? minAge;
  String? pickup;
  int? wifiAvailable;
  int? authorId;
  String? minDayBeforeBooking;
  Location? location;
  String? hasWishList;
  Map? translation;
  CategoryTour? categoryTour;

  Rows(
      {this.id,
        this.title,
        this.slug,
        this.content,
        this.imageId,
        this.bannerImageId,
        this.shortDesc,
        this.categoryId,
        this.locationId,
        this.address,
        this.mapLat,
        this.mapLng,
        this.mapZoom,
        this.isFeatured,
        this.gallery,
        this.video,
        this.price,
        this.salePrice,
        this.duration,
        this.minPeople,
        this.maxPeople,
        this.faqs,
        this.status,
        this.publishDate,
        this.createUser,
        this.updateUser,
        this.deletedAt,
        this.originId,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.defaultState,
        this.enableFixedDate,
        this.startDate,
        this.endDate,
        this.lastBookingDate,
        this.include,
        this.exclude,
        this.itinerary,
        this.reviewScore,
        this.icalImportUrl,
        this.enableServiceFee,
        this.serviceFee,
        this.surrounding,
        this.dateFormTo,
        this.minAge,
        this.pickup,
        this.wifiAvailable,
        this.authorId,
        this.minDayBeforeBooking,
        this.location,
        this.hasWishList,
        this.translation,
        this.categoryTour});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    if (json['image_id'] != null) {
      imageId = <ImageId>[];
      json['image_id'].forEach((v) {
        imageId!.add(new ImageId.fromJson(v));
      });
    }else{
      imageId = <ImageId>[];
    }
    bannerImageId = json['banner_image_id'];
    shortDesc = json['short_desc'];
    categoryId = json['category_id'];
    locationId = json['location_id'];
    address = json['address'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    mapZoom = json['map_zoom'];
    isFeatured = json['is_featured'];
    gallery = json['gallery'];
    video = json['video'];
    price = json['price'];
    salePrice = json['sale_price'];
    duration = json['duration'];
    minPeople = json['min_people'];
    maxPeople = json['max_people'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
    status = json['status'];
    publishDate = json['publish_date'];
    createUser = json['create_user'].toString();
    updateUser = json['update_user'].toString();
    deletedAt = json['deleted_at'];
    originId = json['origin_id'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    defaultState = json['default_state'];
    enableFixedDate = json['enable_fixed_date'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    lastBookingDate = json['last_booking_date'];
    if (json['include'] != null) {
      include = <Include>[];
      json['include'].forEach((v) {
        include!.add(new Include.fromJson(v));
      });
    }
    if (json['exclude'] != null) {
      exclude = <Include>[];
      json['exclude'].forEach((v) {
        exclude!.add(new Include.fromJson(v));
      });
    }
    if (json['itinerary'] != null) {
      itinerary = <Itinerary>[];
      json['itinerary'].forEach((v) {
        itinerary!.add(new Itinerary.fromJson(v));
      });
    }
    reviewScore = json['review_score'];
    icalImportUrl = json['ical_import_url'];
    enableServiceFee = json['enable_service_fee'];
    serviceFee = json['service_fee'];
    surrounding = json['surrounding'];
    dateFormTo = json['date_form_to'];
    minAge = json['min_age'];
    pickup = json['pickup'];
    wifiAvailable = json['wifi_available'];
    authorId = json['author_id'];
    minDayBeforeBooking = json['min_day_before_booking'].toString();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    hasWishList = json['has_wish_list'];
    translation = json['translation'];
    categoryTour = json['category_tour'] != null
        ? new CategoryTour.fromJson(json['category_tour'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['content'] = this.content;
    if (this.imageId != null) {
      data['image_id'] = this.imageId!.map((v) => v.toJson()).toList();
    }
    data['banner_image_id'] = this.bannerImageId;
    data['short_desc'] = this.shortDesc;
    data['category_id'] = this.categoryId;
    data['location_id'] = this.locationId;
    data['address'] = this.address;
    data['map_lat'] = this.mapLat;
    data['map_lng'] = this.mapLng;
    data['map_zoom'] = this.mapZoom;
    data['is_featured'] = this.isFeatured;
    data['gallery'] = this.gallery;
    data['video'] = this.video;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['duration'] = this.duration;
    data['min_people'] = this.minPeople;
    data['max_people'] = this.maxPeople;
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['publish_date'] = this.publishDate;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] = this.deletedAt;
    data['origin_id'] = this.originId;
    data['lang'] = this.lang;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['default_state'] = this.defaultState;
    data['enable_fixed_date'] = this.enableFixedDate;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['last_booking_date'] = this.lastBookingDate;
    if (this.include != null) {
      data['include'] = this.include!.map((v) => v.toJson()).toList();
    }
    if (this.exclude != null) {
      data['exclude'] = this.exclude!.map((v) => v.toJson()).toList();
    }
    if (this.itinerary != null) {
      data['itinerary'] = this.itinerary!.map((v) => v.toJson()).toList();
    }
    data['review_score'] = this.reviewScore;
    data['ical_import_url'] = this.icalImportUrl;
    data['enable_service_fee'] = this.enableServiceFee;
    data['service_fee'] = this.serviceFee;
    data['surrounding'] = this.surrounding;
    data['date_form_to'] = this.dateFormTo;
    data['min_age'] = this.minAge;
    data['pickup'] = this.pickup;
    data['wifi_available'] = this.wifiAvailable;
    data['author_id'] = this.authorId;
    data['min_day_before_booking'] = this.minDayBeforeBooking;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['has_wish_list'] = this.hasWishList;
    data['translation'] = this.translation;
    if (this.categoryTour != null) {
      data['category_tour'] = this.categoryTour!.toJson();
    }
    return data;
  }
}

class ImageId {
  String? large;
  String? thumb;

  ImageId({this.large, this.thumb});

  ImageId.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Faqs {
  String? title;
  String? content;

  Faqs({this.title, this.content});

  Faqs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}

class Include {
  String? title;

  Include({this.title});

  Include.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

class Itinerary {
  String? imageId;
  String? title;
  String? desc;
  String? content;

  Itinerary({this.imageId, this.title, this.desc, this.content});

  Itinerary.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    title = json['title'];
    desc = json['desc'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_id'] = this.imageId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['content'] = this.content;
    return data;
  }
}

class Location {
  int? id;
  String? name;
  String? content;
  String? slug;
  int? imageId;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  String? status;
  int? iLft;
  int? iRgt;
  String? parentId;
  int? createUser;
  String? updateUser;
  String? deletedAt;
  String? originId;
  String? lang;
  String? createdAt;
  String? updatedAt;
  int? bannerImageId;
  String? tripIdeas;
  String? translation;

  Location(
      {this.id,
        this.name,
        this.content,
        this.slug,
        this.imageId,
        this.mapLat,
        this.mapLng,
        this.mapZoom,
        this.status,
        this.iLft,
        this.iRgt,
        this.parentId,
        this.createUser,
        this.updateUser,
        this.deletedAt,
        this.originId,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.bannerImageId,
        this.tripIdeas,
        this.translation});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    slug = json['slug'];
    imageId = json['image_id'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    mapZoom = json['map_zoom'];
    status = json['status'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'].toString();
    deletedAt = json['deleted_at'];
    originId = json['origin_id'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bannerImageId = json['banner_image_id'];
    tripIdeas = json['trip_ideas'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['slug'] = this.slug;
    data['image_id'] = this.imageId;
    data['map_lat'] = this.mapLat;
    data['map_lng'] = this.mapLng;
    data['map_zoom'] = this.mapZoom;
    data['status'] = this.status;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] = this.deletedAt;
    data['origin_id'] = this.originId;
    data['lang'] = this.lang;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['banner_image_id'] = this.bannerImageId;
    data['trip_ideas'] = this.tripIdeas;
    data['translation'] = this.translation;
    return data;
  }
}

class CategoryTour {
  int? id;
  String? name;
  String? content;
  String? slug;
  String? status;
  int? iLft;
  int? iRgt;
  String? parentId;
  String? createUser;
  String? updateUser;
  String? deletedAt;
  String? originId;
  String? lang;
  String? createdAt;
  String? updatedAt;
  String? translation;

  CategoryTour(
      {this.id,
        this.name,
        this.content,
        this.slug,
        this.status,
        this.iLft,
        this.iRgt,
        this.parentId,
        this.createUser,
        this.updateUser,
        this.deletedAt,
        this.originId,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.translation});

  CategoryTour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    slug = json['slug'];
    status = json['status'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    originId = json['origin_id'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] = this.deletedAt;
    data['origin_id'] = this.originId;
    data['lang'] = this.lang;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['translation'] = this.translation;
    return data;
  }
}
