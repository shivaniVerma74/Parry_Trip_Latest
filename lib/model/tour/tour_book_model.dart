class TourBookModel {
  int? id;
  String? code;
  int? vendorId;
  int? customerId;
  String? paymentId;
  String? gateway;
  String? bookingId;
  int? objectId;
  String? objectModel;
  String? startDate;
  String? endDate;
  String? total;
  int? totalGuests;
  String? currency;
  String? status;
  String? deposit;
  String? depositType;
  int? commission;
  String? commissionType;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? address2;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? customerNotes;
  String? vendorServiceFeeAmount;
  String? vendorServiceFee;
  int? createUser;
  int? updateUser;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? buyerFees;
  String? totalBeforeFees;
  String? paidVendor;
  String? objectChildId;
  String? number;
  String? paid;
  String? payNow;
  int? walletCreditUsed;
  int? walletTotalUsed;
  String? walletTransactionId;
  String? isRefundWallet;
  String? isPaid;
  String? totalBeforeDiscount;
  String? couponAmount;
  String? bookinDeatils;
  Service? service;

  TourBookModel(
      {this.id,
        this.code,
        this.vendorId,
        this.customerId,
        this.paymentId,
        this.gateway,
        this.bookingId,
        this.objectId,
        this.objectModel,
        this.startDate,
        this.endDate,
        this.total,
        this.totalGuests,
        this.currency,
        this.status,
        this.deposit,
        this.depositType,
        this.commission,
        this.commissionType,
        this.email,
        this.firstName,
        this.lastName,
        this.phone,
        this.address,
        this.address2,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.customerNotes,
        this.vendorServiceFeeAmount,
        this.vendorServiceFee,
        this.createUser,
        this.updateUser,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.buyerFees,
        this.totalBeforeFees,
        this.paidVendor,
        this.objectChildId,
        this.number,
        this.paid,
        this.payNow,
        this.walletCreditUsed,
        this.walletTotalUsed,
        this.walletTransactionId,
        this.isRefundWallet,
        this.isPaid,
        this.totalBeforeDiscount,
        this.couponAmount,
        this.bookinDeatils,
        this.service});

  TourBookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    vendorId = json['vendor_id'];
    customerId = json['customer_id'];
    paymentId = json['payment_id'];
    gateway = json['gateway'];
    bookingId = json['booking_id'];
    objectId = json['object_id'];
    objectModel = json['object_model'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    total = json['total'];
    totalGuests = json['total_guests'];
    currency = json['currency'];
    status = json['status'];
    deposit = json['deposit'];
    depositType = json['deposit_type'];
    commission = json['commission'];
    commissionType = json['commission_type'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    address = json['address'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    customerNotes = json['customer_notes'];
    vendorServiceFeeAmount = json['vendor_service_fee_amount'];
    vendorServiceFee = json['vendor_service_fee'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buyerFees = json['buyer_fees'];
    totalBeforeFees = json['total_before_fees'];
    paidVendor = json['paid_vendor'];
    objectChildId = json['object_child_id'];
    number = json['number'];
    paid = json['paid'];
    payNow = json['pay_now'];
    walletCreditUsed = json['wallet_credit_used'];
    walletTotalUsed = json['wallet_total_used'];
    walletTransactionId = json['wallet_transaction_id'];
    isRefundWallet = json['is_refund_wallet'];
    isPaid = json['is_paid'];
    totalBeforeDiscount = json['total_before_discount'];
    couponAmount = json['coupon_amount'];
    bookinDeatils = json['bookin_deatils'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['vendor_id'] = this.vendorId;
    data['customer_id'] = this.customerId;
    data['payment_id'] = this.paymentId;
    data['gateway'] = this.gateway;
    data['booking_id'] = this.bookingId;
    data['object_id'] = this.objectId;
    data['object_model'] = this.objectModel;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['total'] = this.total;
    data['total_guests'] = this.totalGuests;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['deposit'] = this.deposit;
    data['deposit_type'] = this.depositType;
    data['commission'] = this.commission;
    data['commission_type'] = this.commissionType;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['country'] = this.country;
    data['customer_notes'] = this.customerNotes;
    data['vendor_service_fee_amount'] = this.vendorServiceFeeAmount;
    data['vendor_service_fee'] = this.vendorServiceFee;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['buyer_fees'] = this.buyerFees;
    data['total_before_fees'] = this.totalBeforeFees;
    data['paid_vendor'] = this.paidVendor;
    data['object_child_id'] = this.objectChildId;
    data['number'] = this.number;
    data['paid'] = this.paid;
    data['pay_now'] = this.payNow;
    data['wallet_credit_used'] = this.walletCreditUsed;
    data['wallet_total_used'] = this.walletTotalUsed;
    data['wallet_transaction_id'] = this.walletTransactionId;
    data['is_refund_wallet'] = this.isRefundWallet;
    data['is_paid'] = this.isPaid;
    data['total_before_discount'] = this.totalBeforeDiscount;
    data['coupon_amount'] = this.couponAmount;
    data['bookin_deatils'] = this.bookinDeatils;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Service {
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

  Service(
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
        this.minDayBeforeBooking});

  Service.fromJson(Map<String, dynamic> json) {
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
