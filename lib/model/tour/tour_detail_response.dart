class TourDetailsResponse {
  DetailRow? row;
  Translation? translation;

  TourDetailsResponse({this.row,this.translation});

  TourDetailsResponse.fromJson(Map<String, dynamic> json) {
    row = json['row'] != null ? new DetailRow.fromJson(json['row']) : null;

    translation = json['translation'] != null
        ? new Translation.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.row != null) {
      data['row'] = this.row!.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation!.toJson();
    }
    return data;
  }
}

class DetailRow {
  int? id;
  String? title;
  String? slug;
  String? content;
  String? imageId;
  int? bannerImageId;
  String? shortDesc;
  int? categoryId;
  int? locationId;
  String? address;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  int? isFeatured;
  List<Gallery>? gallery;
  String? video;
  String? price;
  String? salePrice;
  int? duration;
  int? minPeople;
  int? maxPeople;
  List<Faqs>? faqs;
  String? status;
  Null? publishDate;
  Null? createUser;
  Null? updateUser;
  Null? deletedAt;
  Null? originId;
  Null? lang;
  String? createdAt;
  String? updatedAt;
  int? defaultState;
  int? enableFixedDate;
  Null? startDate;
  Null? endDate;
  Null? lastBookingDate;
  List<Include>? include;
  List<Include>? exclude;
  List<Itinerary>? itinerary;
  String? reviewScore;
  Null? icalImportUrl;
  Null? enableServiceFee;
  Null? serviceFee;
  Null? surrounding;
  String? dateFormTo;
  String? minAge;
  String? pickup;
  int? wifiAvailable;
  int? authorId;
  Null? minDayBeforeBooking;
  Location? location;
  Null? translation;
  Null? hasWishList;
  Meta? meta;

  DetailRow(
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
        this.translation,
        this.hasWishList,
        this.meta});

  DetailRow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    imageId = json['image_id'];
    bannerImageId = json['banner_image_id'];
    shortDesc = json['short_desc'];
    categoryId = json['category_id'];
    locationId = json['location_id'];
    address = json['address'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    mapZoom = json['map_zoom'];
    isFeatured = json['is_featured'];
    video = json['video'];
    price = json['price'];
    salePrice = json['sale_price'];
    duration = json['duration'];
    minPeople = json['min_people'];
    maxPeople = json['max_people'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
    status = json['status'];
    publishDate = json['publish_date'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
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
    minDayBeforeBooking = json['min_day_before_booking'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    translation = json['translation'];
    hasWishList = json['has_wish_list'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['content'] = this.content;
    data['image_id'] = this.imageId;
    data['banner_image_id'] = this.bannerImageId;
    data['short_desc'] = this.shortDesc;
    data['category_id'] = this.categoryId;
    data['location_id'] = this.locationId;
    data['address'] = this.address;
    data['map_lat'] = this.mapLat;
    data['map_lng'] = this.mapLng;
    data['map_zoom'] = this.mapZoom;
    data['is_featured'] = this.isFeatured;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
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
    data['translation'] = this.translation;
    data['has_wish_list'] = this.hasWishList;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
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
  Null? parentId;
  int? createUser;
  Null? updateUser;
  Null? deletedAt;
  Null? originId;
  Null? lang;
  String? createdAt;
  String? updatedAt;
  int? bannerImageId;
  String? tripIdeas;
  Null? translation;

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
    updateUser = json['update_user'];
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

class Meta {
  int? id;
  int? tourId;
  int? enablePersonTypes;
  List<PersonTypes>? personTypes;
  int? enableExtraPrice;
  List<ExtraPrice>? extraPrice;
  Null? discountByPeople;
  Null? enableOpenHours;
  Null? openHours;
  Null? createUser;
  Null? updateUser;
  Null? createdAt;
  Null? updatedAt;

  Meta(
      {this.id,
        this.tourId,
        this.enablePersonTypes,
        this.personTypes,
        this.enableExtraPrice,
        this.extraPrice,
        this.discountByPeople,
        this.enableOpenHours,
        this.openHours,
        this.createUser,
        this.updateUser,
        this.createdAt,
        this.updatedAt});

  Meta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tourId = json['tour_id'];
    enablePersonTypes = json['enable_person_types'];
    if (json['person_types'] != null) {
      personTypes = <PersonTypes>[];
      json['person_types'].forEach((v) {
        personTypes!.add(new PersonTypes.fromJson(v));
      });
    }
    enableExtraPrice = json['enable_extra_price'];
    if (json['extra_price'] != null) {
      extraPrice = <ExtraPrice>[];
      json['extra_price'].forEach((v) {
        extraPrice!.add(new ExtraPrice.fromJson(v));
      });
    }
    discountByPeople = json['discount_by_people'];
    enableOpenHours = json['enable_open_hours'];
    openHours = json['open_hours'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tour_id'] = this.tourId;
    data['enable_person_types'] = this.enablePersonTypes;
    if (this.personTypes != null) {
      data['person_types'] = this.personTypes!.map((v) => v.toJson()).toList();
    }
    data['enable_extra_price'] = this.enableExtraPrice;
    if (this.extraPrice != null) {
      data['extra_price'] = this.extraPrice!.map((v) => v.toJson()).toList();
    }
    data['discount_by_people'] = this.discountByPeople;
    data['enable_open_hours'] = this.enableOpenHours;
    data['open_hours'] = this.openHours;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PersonTypes {
  String? name;
  String? desc;
  String? min;
  String? max;
  String? price;

  PersonTypes({this.name, this.desc, this.min, this.max, this.price});

  PersonTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    min = json['min'];
    max = json['max'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['min'] = this.min;
    data['max'] = this.max;
    data['price'] = this.price;
    return data;
  }
}

class ExtraPrice {
  String? name;
  String? price;
  String? type;

  ExtraPrice({this.name, this.price, this.type});

  ExtraPrice.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['type'] = this.type;
    return data;
  }
}

class Translation {
  String? locale;
  int? originId;
  String? title;
  String? content;
  String? shortDesc;
  String? address;
  List<Faqs>? faqs;
  List<Include>? include;
  List<Include>? exclude;
  List<Itinerary>? itinerary;
  Null? surrounding;

  Translation(
      {this.locale,
        this.originId,
        this.title,
        this.content,
        this.shortDesc,
        this.address,
        this.faqs,
        this.include,
        this.exclude,
        this.itinerary,
        this.surrounding});

  Translation.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    originId = json['origin_id'];
    title = json['title'];
    content = json['content'];
    shortDesc = json['short_desc'];
    address = json['address'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
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
    surrounding = json['surrounding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locale'] = this.locale;
    data['origin_id'] = this.originId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['short_desc'] = this.shortDesc;
    data['address'] = this.address;
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    if (this.include != null) {
      data['include'] = this.include!.map((v) => v.toJson()).toList();
    }
    if (this.exclude != null) {
      data['exclude'] = this.exclude!.map((v) => v.toJson()).toList();
    }
    if (this.itinerary != null) {
      data['itinerary'] = this.itinerary!.map((v) => v.toJson()).toList();
    }
    data['surrounding'] = this.surrounding;
    return data;
  }
}
