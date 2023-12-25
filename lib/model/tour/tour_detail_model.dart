import 'dart:core';

class TourDetailModel {
  DetailRow? row;
  Translation? translation;
  List<TourRelated>? tourRelated;
  BookingData? bookingData;
  ReviewList? reviewList;
  SeoMeta? seoMeta;
  String? bodyClass;
  List<Breadcrumbs>? breadcrumbs;

  TourDetailModel({this.row, this.translation, this.tourRelated, this.bookingData, this.reviewList, this.seoMeta, this.bodyClass, this.breadcrumbs});

  TourDetailModel.fromJson(Map<String, dynamic> json) {
    row = json['row'] != null ? new DetailRow.fromJson(json['row']) : null;
    translation = json['translation'] != null ? new Translation.fromJson(json['translation']) : null;
    if (json['tour_related'] != null) {
      tourRelated = <TourRelated>[];
      json['tour_related'].forEach((v) { tourRelated!.add(new TourRelated.fromJson(v)); });
    }
    bookingData = json['booking_data'] != null ? new BookingData.fromJson(json['booking_data']) : null;
    reviewList = json['review_list'] != null ? new ReviewList.fromJson(json['review_list']) : null;
    seoMeta = json['seo_meta'] != null ? new SeoMeta.fromJson(json['seo_meta']) : null;
    bodyClass = json['body_class'];
    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Breadcrumbs>[];
      json['breadcrumbs'].forEach((v) { breadcrumbs!.add(new Breadcrumbs.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.row != null) {
      data['row'] = this.row!.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation!.toJson();
    }
    if (this.tourRelated != null) {
      data['tour_related'] = this.tourRelated!.map((v) => v.toJson()).toList();
    }
    if (this.bookingData != null) {
      data['booking_data'] = this.bookingData!.toJson();
    }
    if (this.reviewList != null) {
      data['review_list'] = this.reviewList!.toJson();
    }
    if (this.seoMeta != null) {
      data['seo_meta'] = this.seoMeta!.toJson();
    }
    data['body_class'] = this.bodyClass;
    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class   DetailRow
{
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
  Map<String, dynamic>? translation;
  String? hasWishList;
  Meta? meta;

  DetailRow({this.id, this.title, this.slug, this.content, this.imageId, this.bannerImageId, this.shortDesc, this.categoryId, this.locationId, this.address, this.mapLat, this.mapLng, this.mapZoom, this.isFeatured, this.gallery, this.video, this.price, this.salePrice, this.duration, this.minPeople, this.maxPeople, this.faqs, this.status, this.publishDate, this.createUser, this.updateUser, this.deletedAt, this.originId, this.lang, this.createdAt, this.updatedAt, this.defaultState, this.enableFixedDate, this.startDate, this.endDate, this.lastBookingDate, this.include, this.exclude, this.itinerary, this.reviewScore, this.icalImportUrl, this.enableServiceFee, this.serviceFee, this.surrounding, this.dateFormTo, this.minAge, this.pickup, this.wifiAvailable, this.authorId, this.minDayBeforeBooking, this.location, this.translation, this.hasWishList, this.meta});

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
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) { gallery!.add(new Gallery.fromJson(v)); });
    }
    video = json['video'];
    price = json['price'];
    salePrice = json['sale_price'];
    duration = json['duration'];
    minPeople = json['min_people'];
    maxPeople = json['max_people'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) { faqs!.add(new Faqs.fromJson(v)); });
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
      json['include'].forEach((v) { include!.add(new Include.fromJson(v)); });
    }
    if (json['exclude'] != null) {
      exclude = <Include>[];
      json['exclude'].forEach((v) { exclude!.add(new Include.fromJson(v)); });
    }
    if (json['itinerary'] != null) {
      itinerary = <Itinerary>[];
      json['itinerary'].forEach((v) { itinerary!.add(new Itinerary.fromJson(v)); });
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
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
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
  String? imageUrl;

  Itinerary({this.imageId, this.title, this.desc, this.content, this.imageUrl});

  Itinerary.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    title = json['title'];
    desc = json['desc'];
    content = json['content'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_id'] = this.imageId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['content'] = this.content;
    data['image_url'] = this.imageUrl;
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
  String? bannerImageId;
  String? tripIdeas;
  String? translation;

  Location({this.id, this.name, this.content, this.slug, this.imageId, this.mapLat, this.mapLng, this.mapZoom, this.status, this.iLft, this.iRgt, this.parentId, this.createUser, this.updateUser, this.deletedAt, this.originId, this.lang, this.createdAt, this.updatedAt, this.bannerImageId, this.tripIdeas, this.translation});

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
    bannerImageId = json['banner_image_id'].toString();
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
  String? discountByPeople;
  String? enableOpenHours;
  Map<String, dynamic>? openHours;
  String? createUser;
  String? updateUser;
  String? createdAt;
  String? updatedAt;

  Meta({this.id, this.tourId, this.enablePersonTypes, this.personTypes, this.enableExtraPrice, this.extraPrice, this.discountByPeople, this.enableOpenHours, this.openHours, this.createUser, this.updateUser, this.createdAt, this.updatedAt});

  Meta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tourId = json['tour_id'];
    enablePersonTypes = json['enable_person_types'];
    if (json['person_types'] != null) {
      personTypes = <PersonTypes>[];
      json['person_types'].forEach((v) { personTypes!.add(new PersonTypes.fromJson(v)); });
    }
    enableExtraPrice = json['enable_extra_price'];
    if (json['extra_price'] != null) {
      extraPrice = <ExtraPrice>[];
      json['extra_price'].forEach((v) { extraPrice!.add(new ExtraPrice.fromJson(v)); });
    }
    discountByPeople = json['discount_by_people'];
    enableOpenHours = json['enable_open_hours'];
    openHours = json['open_hours'];
    createUser = json['create_user'].toString();
    updateUser = json['update_user'].toString();
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



class ExtraPrice {
  String? name;
  String? price;
  String? type;
  int? number;
  int? enable;
  String? priceHtml;
  String? priceType;
  bool? checked;
  ExtraPrice({this.name, this.price, this.type,this.checked, this.number,
    this.enable,
    this.priceHtml,
    this.priceType});

  ExtraPrice.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    type = json['type'];
    number = json['number'];
    enable = json['enable'];
    priceHtml = json['price_html'];
    priceType = json['price_type'];
    checked = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['type'] = this.type;
    data['number'] = this.number;
    data['enable'] = this.enable;
    data['price_html'] = this.priceHtml;
    data['price_type'] = this.priceType;
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
  String? surrounding;

  Translation({this.locale, this.originId, this.title, this.content, this.shortDesc, this.address, this.faqs, this.include, this.exclude, this.itinerary, this.surrounding});

  Translation.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    originId = json['origin_id'];
    title = json['title'];
    content = json['content'];
    shortDesc = json['short_desc'];
    address = json['address'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) { faqs!.add(new Faqs.fromJson(v)); });
    }
    if (json['include'] != null) {
      include = <Include>[];
      json['include'].forEach((v) { include!.add(new Include.fromJson(v)); });
    }
    if (json['exclude'] != null) {
      exclude = <Include>[];
      json['exclude'].forEach((v) { exclude!.add(new Include.fromJson(v)); });
    }
    if (json['itinerary'] != null) {
      itinerary = <Itinerary>[];
      json['itinerary'].forEach((v) { itinerary!.add(new Itinerary.fromJson(v)); });
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

class TourRelated {
  int? id;
  String? title;
  String? slug;
  String? content;
  int? imageId;
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
  String? translation;
  String? hasWishList;

  TourRelated({this.id, this.title, this.slug, this.content, this.imageId, this.bannerImageId, this.shortDesc, this.categoryId, this.locationId, this.address, this.mapLat, this.mapLng, this.mapZoom, this.isFeatured, this.gallery, this.video, this.price, this.salePrice, this.duration, this.minPeople, this.maxPeople, this.faqs, this.status, this.publishDate, this.createUser, this.updateUser, this.deletedAt, this.originId, this.lang, this.createdAt, this.updatedAt, this.defaultState, this.enableFixedDate, this.startDate, this.endDate, this.lastBookingDate, this.include, this.exclude, this.itinerary, this.reviewScore, this.icalImportUrl, this.enableServiceFee, this.serviceFee, this.surrounding, this.dateFormTo, this.minAge, this.pickup, this.wifiAvailable, this.authorId, this.minDayBeforeBooking, this.location, this.translation, this.hasWishList});

  TourRelated.fromJson(Map<String, dynamic> json) {
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
    gallery = json['gallery'];
    video = json['video'];
    price = json['price'];
    salePrice = json['sale_price'];
    duration = json['duration'];
    minPeople = json['min_people'];
    maxPeople = json['max_people'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) { faqs!.add(new Faqs.fromJson(v)); });
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
      json['include'].forEach((v) { include!.add(new Include.fromJson(v)); });
    }
    if (json['exclude'] != null) {
      exclude = <Include>[];
      json['exclude'].forEach((v) { exclude!.add(new Include.fromJson(v)); });
    }
    if (json['itinerary'] != null) {
      itinerary = <Itinerary>[];
      json['itinerary'].forEach((v) { itinerary!.add(new Itinerary.fromJson(v)); });
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
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    translation = json['translation'].toString();
    hasWishList = json['has_wish_list'];
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
    data['translation'] = this.translation;
    data['has_wish_list'] = this.hasWishList;
    return data;
  }
}

class BookingData {
  int? id;
  List<PersonTypes>? personTypes;
  int? max;
  List<Null>? openHours;
  List<ExtraPrice>? extraPrice;
  String? minDate;
  int? duration;
  List<BuyerFees>? buyerFees;
  String? startDate;
  String? startDateHtml;
  String? endDate;
  String? endDateHtml;
  bool? deposit;
  String? depositType;
  String? depositAmount;
  String? depositFomular;
  bool? isFormEnquiryAndBook;
  String? enquiryType;
  bool? isFixedDate;

  BookingData({this.id, this.personTypes, this.max, this.openHours, this.extraPrice, this.minDate, this.duration, this.buyerFees, this.startDate, this.startDateHtml, this.endDate, this.endDateHtml, this.deposit, this.depositType, this.depositAmount, this.depositFomular, this.isFormEnquiryAndBook, this.enquiryType, this.isFixedDate});

  BookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['person_types'] != null) {
      personTypes = <PersonTypes>[];
      json['person_types'].forEach((v) { personTypes!.add(new PersonTypes.fromJson(v)); });
    }
    max = json['max'];
    if (json['open_hours'] != null) {
      openHours = <Null>[];
      json['open_hours'].forEach((v) { openHours!.add(v); });
    }
    if (json['extra_price'] != null) {
      extraPrice = <ExtraPrice>[];
      json['extra_price'].forEach((v) { extraPrice!.add(new ExtraPrice.fromJson(v)); });
    }
    minDate = json['minDate'];
    duration = json['duration'];
    if (json['buyer_fees'] != null) {
      buyerFees = <BuyerFees>[];
      json['buyer_fees'].forEach((v) { buyerFees!.add(new BuyerFees.fromJson(v)); });
    }
    startDate = json['start_date'];
    startDateHtml = json['start_date_html'];
    endDate = json['end_date'];
    endDateHtml = json['end_date_html'];
    deposit = json['deposit'];
    depositType = json['deposit_type'];
    depositAmount = json['deposit_amount'];
    depositFomular = json['deposit_fomular'];
    isFormEnquiryAndBook = json['is_form_enquiry_and_book'];
    enquiryType = json['enquiry_type'];
    isFixedDate = json['is_fixed_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.personTypes != null) {
      data['person_types'] = this.personTypes!.map((v) => v.toJson()).toList();
    }
    data['max'] = this.max;
    if (this.openHours != null) {
      data['open_hours'] = this.openHours!.map((v) => v);
    }
    if (this.extraPrice != null) {
      data['extra_price'] = this.extraPrice!.map((v) => v.toJson()).toList();
    }
    data['minDate'] = this.minDate;
    data['duration'] = this.duration;
    if (this.buyerFees != null) {
      data['buyer_fees'] = this.buyerFees!.map((v) => v.toJson()).toList();
    }
    data['start_date'] = this.startDate;
    data['start_date_html'] = this.startDateHtml;
    data['end_date'] = this.endDate;
    data['end_date_html'] = this.endDateHtml;
    data['deposit'] = this.deposit;
    data['deposit_type'] = this.depositType;
    data['deposit_amount'] = this.depositAmount;
    data['deposit_fomular'] = this.depositFomular;
    data['is_form_enquiry_and_book'] = this.isFormEnquiryAndBook;
    data['enquiry_type'] = this.enquiryType;
    data['is_fixed_date'] = this.isFixedDate;
    return data;
  }
}

class PersonTypes {
  String? name;
  String? desc;
  String? min;
  String? max;
  String? price;
  String? number;
  String? count;
  String? displayPrice;

  PersonTypes({this.name, this.desc, this.min, this.max, this.price, this.number, this.displayPrice});

  PersonTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    min = json['min'].toString();
    max = json['max'].toString();
    price = json['price'];
    count = json['number'].toString();
    number = json['number'].toString();
    displayPrice = json['display_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['min'] = this.min;
    data['max'] = this.max;
    data['price'] = this.price;
    data['number'] = this.count;
    data['display_price'] = this.displayPrice;
    return data;
  }
}



class BuyerFees {
  String? name;
  String? desc;
  String? price;
  String? unit;
  String? type;
  String? typeName;
  String? typeDesc;
  String? priceType;

  BuyerFees({this.name, this.desc, this.price, this.unit, this.type, this.typeName, this.typeDesc, this.priceType});

  BuyerFees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    unit = json['unit'];
    type = json['type'];
    typeName = json['type_name'];
    typeDesc = json['type_desc'];
    priceType = json['price_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['unit'] = this.unit;
    data['type'] = this.type;
    data['type_name'] = this.typeName;
    data['type_desc'] = this.typeDesc;
    data['price_type'] = this.priceType;
    return data;
  }
}

class ReviewList {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  ReviewList({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  ReviewList.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(new Data.fromJson(v)); });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) { links!.add(new Links.fromJson(v)); });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? content;
  int? rateNumber;
  String? authorIp;
  String? status;
  String? createdAt;
  int? vendorId;
  int? authorId;
  Author? author;

  Data({this.id, this.title, this.content, this.rateNumber, this.authorIp, this.status, this.createdAt, this.vendorId, this.authorId, this.author});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    rateNumber = json['rate_number'];
    authorIp = json['author_ip'];
    status = json['status'];
    createdAt = json['created_at'];
    vendorId = json['vendor_id'];
    authorId = json['author_id'];
    author = json['author'] != null && json['author'] is Map ?  Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['rate_number'] = this.rateNumber;
    data['author_ip'] = this.authorIp;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['vendor_id'] = this.vendorId;
    data['author_id'] = this.authorId;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

class Author {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? avatarId;

  Author({this.id, this.name, this.firstName, this.lastName, this.avatarId});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatarId = json['avatar_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar_id'] = this.avatarId;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class SeoMeta {
  String? slug;
  String? fullUrl;
  String? serviceTitle;
  String? serviceDesc;
  String? serviceImage;

  SeoMeta({this.slug, this.fullUrl, this.serviceTitle, this.serviceDesc, this.serviceImage});

  SeoMeta.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    fullUrl = json['full_url'];
    serviceTitle = json['service_title'];
    serviceDesc = json['service_desc'];
    serviceImage = json['service_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['full_url'] = this.fullUrl;
    data['service_title'] = this.serviceTitle;
    data['service_desc'] = this.serviceDesc;
    data['service_image'] = this.serviceImage;
    return data;
  }
}

class Breadcrumbs {
  String? name;
  String? url;
  String? class1;

  Breadcrumbs({this.name, this.url, this.class1});

  Breadcrumbs.fromJson(Map<String, dynamic> json) {
  name = json['name'];
  url = json['url'];
  class1 = json['class'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = this.name;
  data['url'] = this.url;
  data['class'] = this.class1;
  return data;
  }
}
