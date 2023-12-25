class FlightBookModel {
  int? id;
  String? code;
  String? vendorId;
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
  String? updateUser;
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
  String? walletCreditUsed;
  String? walletTotalUsed;
  String? walletTransactionId;
  String? isRefundWallet;
  String? isPaid;
  String? totalBeforeDiscount;
  String? couponAmount;
  BookinDeatils? bookinDeatils;

  FlightBookModel(
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
        this.bookinDeatils});

  FlightBookModel.fromJson(Map<String, dynamic> json) {
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
    bookinDeatils = json['bookin_deatils'] != null
        ? new BookinDeatils.fromJson(json['bookin_deatils'])
        : null;
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
    if (this.bookinDeatils != null) {
      data['bookin_deatils'] = this.bookinDeatils!.toJson();
    }
    return data;
  }
}

class BookinDeatils {
  Order? order;
  Status? status;
  Map? gstInfo;
  ItemInfos? itemInfos;

  BookinDeatils({this.order, this.status, this.gstInfo, this.itemInfos});

  BookinDeatils.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    gstInfo = json['gstInfo'];
    itemInfos = json['itemInfos'] != null
        ? new ItemInfos.fromJson(json['itemInfos'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['gstInfo'] = this.gstInfo;
    if (this.itemInfos != null) {
      data['itemInfos'] = this.itemInfos!.toJson();
    }
    return data;
  }
}

class Order {
  String? amount;
  int? markup;
  String? status;
  String? bookingId;
  String? createdOn;
  DeliveryInfo? deliveryInfo;

  Order(
      {this.amount,
        this.markup,
        this.status,
        this.bookingId,
        this.createdOn,
        this.deliveryInfo});

  Order.fromJson(Map<String, dynamic> json) {
    amount = json['amount'].toString();
    markup = json['markup'];
    status = json['status'];
    bookingId = json['bookingId'];
    createdOn = json['createdOn'];
    deliveryInfo = json['deliveryInfo'] != null
        ? new DeliveryInfo.fromJson(json['deliveryInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['markup'] = this.markup;
    data['status'] = this.status;
    data['bookingId'] = this.bookingId;
    data['createdOn'] = this.createdOn;
    if (this.deliveryInfo != null) {
      data['deliveryInfo'] = this.deliveryInfo!.toJson();
    }
    return data;
  }
}

class DeliveryInfo {
  List<String>? emails;
  List<String>? contacts;

  DeliveryInfo({this.emails, this.contacts});

  DeliveryInfo.fromJson(Map<String, dynamic> json) {
    emails = json['emails'].cast<String>();
    contacts = json['contacts'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emails'] = this.emails;
    data['contacts'] = this.contacts;
    return data;
  }
}

class Status {
  bool? success;
  int? httpStatus;

  Status({this.success, this.httpStatus});

  Status.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    httpStatus = json['httpStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['httpStatus'] = this.httpStatus;
    return data;
  }
}

class ItemInfos {
  AIR? aIR;

  ItemInfos({this.aIR});

  ItemInfos.fromJson(Map<String, dynamic> json) {
    aIR = json['AIR'] != null ? new AIR.fromJson(json['AIR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aIR != null) {
      data['AIR'] = this.aIR!.toJson();
    }
    return data;
  }
}

class AIR {
  bool? isara;
  List<TripInfos>? tripInfos;
  TotalPriceInfo? totalPriceInfo;
  List<TravellerInfos>? travellerInfos;

  AIR({this.isara, this.tripInfos, this.totalPriceInfo, this.travellerInfos});

  AIR.fromJson(Map<String, dynamic> json) {
    isara = json['isara'];
    if (json['tripInfos'] != null) {
      tripInfos = <TripInfos>[];
      json['tripInfos'].forEach((v) {
        tripInfos!.add(new TripInfos.fromJson(v));
      });
    }
    totalPriceInfo = json['totalPriceInfo'] != null
        ? new TotalPriceInfo.fromJson(json['totalPriceInfo'])
        : null;
    if (json['travellerInfos'] != null) {
      travellerInfos = <TravellerInfos>[];
      json['travellerInfos'].forEach((v) {
        travellerInfos!.add(new TravellerInfos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isara'] = this.isara;
    if (this.tripInfos != null) {
      data['tripInfos'] = this.tripInfos!.map((v) => v.toJson()).toList();
    }
    if (this.totalPriceInfo != null) {
      data['totalPriceInfo'] = this.totalPriceInfo!.toJson();
    }
    if (this.travellerInfos != null) {
      data['travellerInfos'] =
          this.travellerInfos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TripInfos {
  List<SI>? sI;

  TripInfos({this.sI});

  TripInfos.fromJson(Map<String, dynamic> json) {
    if (json['sI'] != null) {
      sI = <SI>[];
      json['sI'].forEach((v) {
        sI!.add(new SI.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sI != null) {
      data['sI'] = this.sI!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SI {
  Aa? aa;
  String? at;
  Aa? da;
  String? dt;
  FD? fD;
  String? id;
  int? sN;
  bool? iand;
  bool? isRs;
  int? stops;
  int? duration;

  SI(
      {this.aa,
        this.at,
        this.da,
        this.dt,
        this.fD,
        this.id,
        this.sN,
        this.iand,
        this.isRs,
        this.stops,
        this.duration});

  SI.fromJson(Map<String, dynamic> json) {
    aa = json['aa'] != null ? new Aa.fromJson(json['aa']) : null;
    at = json['at'];
    da = json['da'] != null ? new Aa.fromJson(json['da']) : null;
    dt = json['dt'];
    fD = json['fD'] != null ? new FD.fromJson(json['fD']) : null;
    id = json['id'];
    sN = json['sN'];
    iand = json['iand'];
    isRs = json['isRs'];
    stops = json['stops'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aa != null) {
      data['aa'] = this.aa!.toJson();
    }
    data['at'] = this.at;
    if (this.da != null) {
      data['da'] = this.da!.toJson();
    }
    data['dt'] = this.dt;
    if (this.fD != null) {
      data['fD'] = this.fD!.toJson();
    }
    data['id'] = this.id;
    data['sN'] = this.sN;
    data['iand'] = this.iand;
    data['isRs'] = this.isRs;
    data['stops'] = this.stops;
    data['duration'] = this.duration;
    return data;
  }
}

class Aa {
  String? city;
  String? code;
  String? name;
  String? country;
  String? cityCode;
  String? terminal;
  String? countryCode;

  Aa(
      {this.city,
        this.code,
        this.name,
        this.country,
        this.cityCode,
        this.terminal,
        this.countryCode});

  Aa.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    code = json['code'];
    name = json['name'];
    country = json['country'];
    cityCode = json['cityCode'];
    terminal = json['terminal'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['code'] = this.code;
    data['name'] = this.name;
    data['country'] = this.country;
    data['cityCode'] = this.cityCode;
    data['terminal'] = this.terminal;
    data['countryCode'] = this.countryCode;
    return data;
  }
}

class FD {
  AI? aI;
  String? eT;
  String? fN;

  FD({this.aI, this.eT, this.fN});

  FD.fromJson(Map<String, dynamic> json) {
    aI = json['aI'] != null ? new AI.fromJson(json['aI']) : null;
    eT = json['eT'];
    fN = json['fN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aI != null) {
      data['aI'] = this.aI!.toJson();
    }
    data['eT'] = this.eT;
    data['fN'] = this.fN;
    return data;
  }
}

class AI {
  String? code;
  String? name;
  bool? isLcc;

  AI({this.code, this.name, this.isLcc});

  AI.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    isLcc = json['isLcc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['isLcc'] = this.isLcc;
    return data;
  }
}

class TotalPriceInfo {
  TotalFareDetail? totalFareDetail;

  TotalPriceInfo({this.totalFareDetail});

  TotalPriceInfo.fromJson(Map<String, dynamic> json) {
    totalFareDetail = json['totalFareDetail'] != null
        ? new TotalFareDetail.fromJson(json['totalFareDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalFareDetail != null) {
      data['totalFareDetail'] = this.totalFareDetail!.toJson();
    }
    return data;
  }
}

class TotalFareDetail {
  FC? fC;
  AfC? afC;

  TotalFareDetail({this.fC, this.afC});

  TotalFareDetail.fromJson(Map<String, dynamic> json) {
    fC = json['fC'] != null ? new FC.fromJson(json['fC']) : null;
    afC = json['afC'] != null ? new AfC.fromJson(json['afC']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fC != null) {
      data['fC'] = this.fC!.toJson();
    }
    if (this.afC != null) {
      data['afC'] = this.afC!.toJson();
    }
    return data;
  }
}

class FC {
  String? bF;
  String? nF;
  String? tF;
  String? tAF;
  String? cGST;
  String? sGST;

  FC({this.bF, this.nF, this.tF, this.tAF, this.cGST, this.sGST});

  FC.fromJson(Map<String, dynamic> json) {
    bF = json['BF'].toString();
    nF = json['NF'].toString();
    tF = json['TF'].toString();
    tAF = json['TAF'].toString();
    cGST = json['CGST'].toString();
    sGST = json['SGST'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BF'] = this.bF;
    data['NF'] = this.nF;
    data['TF'] = this.tF;
    data['TAF'] = this.tAF;
    data['CGST'] = this.cGST;
    data['SGST'] = this.sGST;
    return data;
  }
}

class AfC {
  TAF? tAF;

  AfC({this.tAF});

  AfC.fromJson(Map<String, dynamic> json) {
    tAF = json['TAF'] != null ? new TAF.fromJson(json['TAF']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tAF != null) {
      data['TAF'] = this.tAF!.toJson();
    }
    return data;
  }
}

class TAF {
  int? mF;
  int? oT;
  int? yQ;
  double? mFT;
  int? aGST;

  TAF({this.mF, this.oT, this.yQ, this.mFT, this.aGST});

  TAF.fromJson(Map<String, dynamic> json) {
    mF = json['MF'];
    oT = json['OT'];
    yQ = json['YQ'];
    mFT = json['MFT'];
    aGST = json['AGST'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MF'] = this.mF;
    data['OT'] = this.oT;
    data['YQ'] = this.yQ;
    data['MFT'] = this.mFT;
    data['AGST'] = this.aGST;
    return data;
  }
}

class TravellerInfos {
  String? eD;
  String? fN;
  String? lN;
  String? pt;
  String? ti;
  String? dob;
  String? pNat;
  String? pNum;
  Map? pnrDetails;

  TravellerInfos(
      {this.eD,
        this.fN,
        this.lN,
        this.pt,
        this.ti,
        this.dob,
        this.pNat,
        this.pNum,
        this.pnrDetails});

  TravellerInfos.fromJson(Map<String, dynamic> json) {
    eD = json['eD'];
    fN = json['fN'];
    lN = json['lN'];
    pt = json['pt'];
    ti = json['ti'];
    dob = json['dob'];
    pNat = json['pNat'];
    pNum = json['pNum'];
    pnrDetails = json['pnrDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eD'] = this.eD;
    data['fN'] = this.fN;
    data['lN'] = this.lN;
    data['pt'] = this.pt;
    data['ti'] = this.ti;
    data['dob'] = this.dob;
    data['pNat'] = this.pNat;
    data['pNum'] = this.pNum;
    if (this.pnrDetails != null) {
      data['pnrDetails'] = this.pnrDetails!;
    }
    return data;
  }
}

class PnrDetails {
  String? dELMAA;

  PnrDetails({this.dELMAA});

  PnrDetails.fromJson(Map<String, dynamic> json) {
    dELMAA = json['DEL-MAA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DEL-MAA'] = this.dELMAA;
    return data;
  }
}
