class HotelBookModel {
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

  HotelBookModel(
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

  HotelBookModel.fromJson(Map<String, dynamic> json) {
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
  double? amount;
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
    amount = json['amount'];
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
  List<String>? code;
  List<String>? emails;
  List<String>? contacts;

  DeliveryInfo({this.code, this.emails, this.contacts});

  DeliveryInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'].cast<String>();
    emails = json['emails'].cast<String>();
    contacts = json['contacts'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
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
  HOTEL? hOTEL;

  ItemInfos({this.hOTEL});

  ItemInfos.fromJson(Map<String, dynamic> json) {
    hOTEL = json['HOTEL'] != null ? new HOTEL.fromJson(json['HOTEL']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hOTEL != null) {
      data['HOTEL'] = this.hOTEL!.toJson();
    }
    return data;
  }
}

class HOTEL {
  HInfo? hInfo;
  Query? query;

  HOTEL({this.hInfo, this.query});

  HOTEL.fromJson(Map<String, dynamic> json) {
    hInfo = json['hInfo'] != null ? new HInfo.fromJson(json['hInfo']) : null;
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hInfo != null) {
      data['hInfo'] = this.hInfo!.toJson();
    }
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    return data;
  }
}

class HInfo {
  Ad? ad;
  Gl? gl;
  int? rt;
  Cnt? cnt;
  String? des;
  List<Ops>? ops;
  String? uid;
  String? name;

  HInfo(
      {this.ad,
        this.gl,
        this.rt,
        this.cnt,
        this.des,
        this.ops,
        this.uid,
        this.name});

  HInfo.fromJson(Map<String, dynamic> json) {
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
    gl = json['gl'] != null ? new Gl.fromJson(json['gl']) : null;
    rt = json['rt'];
    cnt = json['cnt'] != null ? new Cnt.fromJson(json['cnt']) : null;
    des = json['des'];
    if (json['ops'] != null) {
      ops = <Ops>[];
      json['ops'].forEach((v) {
        ops!.add(new Ops.fromJson(v));
      });
    }
    uid = json['uid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ad != null) {
      data['ad'] = this.ad!.toJson();
    }
    if (this.gl != null) {
      data['gl'] = this.gl!.toJson();
    }
    data['rt'] = this.rt;
    if (this.cnt != null) {
      data['cnt'] = this.cnt!.toJson();
    }
    data['des'] = this.des;
    if (this.ops != null) {
      data['ops'] = this.ops!.map((v) => v.toJson()).toList();
    }
    data['uid'] = this.uid;
    data['name'] = this.name;
    return data;
  }
}

class Ad {
  String? cn;
  String? sn;
  String? adr;
  String? ctn;
  String? adr2;
  City? city;
  City? state;
  Country? country;
  String? postalCode;

  Ad(
      {this.cn,
        this.sn,
        this.adr,
        this.ctn,
        this.adr2,
        this.city,
        this.state,
        this.country,
        this.postalCode});

  Ad.fromJson(Map<String, dynamic> json) {
    cn = json['cn'];
    sn = json['sn'];
    adr = json['adr'];
    ctn = json['ctn'];
    adr2 = json['adr2'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    state = json['state'] != null ? new City.fromJson(json['state']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cn'] = this.cn;
    data['sn'] = this.sn;
    data['adr'] = this.adr;
    data['ctn'] = this.ctn;
    data['adr2'] = this.adr2;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['postalCode'] = this.postalCode;
    return data;
  }
}

class City {
  String? name;

  City({this.name});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Country {
  String? code;
  String? name;

  Country({this.code, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class Gl {
  String? ln;
  String? lt;

  Gl({this.ln, this.lt});

  Gl.fromJson(Map<String, dynamic> json) {
    ln = json['ln'];
    lt = json['lt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ln'] = this.ln;
    data['lt'] = this.lt;
    return data;
  }
}

class Cnt {
  String? ph;

  Cnt({this.ph});

  Cnt.fromJson(Map<String, dynamic> json) {
    ph = json['ph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ph'] = this.ph;
    return data;
  }
}

class Ops {
  double? tp;
  Cnp? cnp;
  String? ddt;
  bool? ipm;
  bool? ipr;
  Oai? oai;
  List<Ris>? ris;
  List<Null>? inst;
  bool? iopr;

  Ops(
      {this.tp,
        this.cnp,
        this.ddt,
        this.ipm,
        this.ipr,
        this.oai,
        this.ris,
        this.inst,
        this.iopr});

  Ops.fromJson(Map<String, dynamic> json) {
    tp = json['tp'];
    cnp = json['cnp'] != null ? new Cnp.fromJson(json['cnp']) : null;
    ddt = json['ddt'];
    ipm = json['ipm'];
    ipr = json['ipr'];
    oai = json['oai'] != null ? new Oai.fromJson(json['oai']) : null;
    if (json['ris'] != null) {
      ris = <Ris>[];
      json['ris'].forEach((v) {
        ris!.add(new Ris.fromJson(v));
      });
    }
    if (json['inst'] != null) {
      inst = <Null>[];
      json['inst'].forEach((v) {
        inst!.add( v);
      });
    }
    iopr = json['iopr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tp'] = this.tp;
    if (this.cnp != null) {
      data['cnp'] = this.cnp!.toJson();
    }
    data['ddt'] = this.ddt;
    data['ipm'] = this.ipm;
    data['ipr'] = this.ipr;
    if (this.oai != null) {
      data['oai'] = this.oai!.toJson();
    }
    if (this.ris != null) {
      data['ris'] = this.ris!.map((v) => v.toJson()).toList();
    }
    if (this.inst != null) {
      data['inst'] = this.inst!.map((v) => v).toList();
    }
    data['iopr'] = this.iopr;
    return data;
  }
}

class Cnp {
  String? id;
  List<Pd>? pd;
  int? cpb;
  bool? ifra;
  bool? inra;

  Cnp({this.id, this.pd, this.cpb, this.ifra, this.inra});

  Cnp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['pd'] != null) {
      pd = <Pd>[];
      json['pd'].forEach((v) {
        pd!.add(new Pd.fromJson(v));
      });
    }
    cpb = json['cpb'];
    ifra = json['ifra'];
    inra = json['inra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.pd != null) {
      data['pd'] = this.pd!.map((v) => v.toJson()).toList();
    }
    data['cpb'] = this.cpb;
    data['ifra'] = this.ifra;
    data['inra'] = this.inra;
    return data;
  }
}

class Pd {
  String? am;
  String? fdt;
  String? tdt;

  Pd({this.am, this.fdt, this.tdt});

  Pd.fromJson(Map<String, dynamic> json) {
    am = json['am'].toString();
    fdt = json['fdt'];
    tdt = json['tdt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['am'] = this.am;
    data['fdt'] = this.fdt;
    data['tdt'] = this.tdt;
    return data;
  }
}

class Oai {
  String? sid;

  Oai({this.sid});

  Oai.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    return data;
  }
}

class Ris {
  String? id;
  String? mb;
  String? op;
  String? rc;
  String? rt;
  List<Ti>? ti;
  double? tp;
  int? adt;
  int? chd;
  String? ddt;
  List<Pis>? pis;
  String? srn;
  bool? iopr;
  Rexb? rexb;
  String? rsta;
  Tfcs? tfcs;
  Afc? tafcs;
  String? checkInDate;
  String? checkOutDate;

  Ris(
      {this.id,
        this.mb,
        this.op,
        this.rc,
        this.rt,
        this.ti,
        this.tp,
        this.adt,
        this.chd,
        this.ddt,
        this.pis,
        this.srn,
        this.iopr,
        this.rexb,
        this.rsta,
        this.tfcs,
        this.tafcs,
        this.checkInDate,
        this.checkOutDate});

  Ris.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mb = json['mb'];
    op = json['op'];
    rc = json['rc'];
    rt = json['rt'];
    if (json['ti'] != null) {
      ti = <Ti>[];
      json['ti'].forEach((v) {
        ti!.add(new Ti.fromJson(v));
      });
    }
    tp = json['tp'];
    adt = json['adt'];
    chd = json['chd'];
    ddt = json['ddt'];
    if (json['pis'] != null) {
      pis = <Pis>[];
      json['pis'].forEach((v) {
        pis!.add(new Pis.fromJson(v));
      });
    }
    srn = json['srn'];
    iopr = json['iopr'];
    rexb = json['rexb'] != null ? new Rexb.fromJson(json['rexb']) : null;
    rsta = json['rsta'];
    tfcs = json['tfcs'] != null ? new Tfcs.fromJson(json['tfcs']) : null;
    tafcs = json['tafcs'] != null ? new Afc.fromJson(json['tafcs']) : null;
    checkInDate = json['checkInDate'];
    checkOutDate = json['checkOutDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mb'] = this.mb;
    data['op'] = this.op;
    data['rc'] = this.rc;
    data['rt'] = this.rt;
    if (this.ti != null) {
      data['ti'] = this.ti!.map((v) => v.toJson()).toList();
    }
    data['tp'] = this.tp;
    data['adt'] = this.adt;
    data['chd'] = this.chd;
    data['ddt'] = this.ddt;
    if (this.pis != null) {
      data['pis'] = this.pis!.map((v) => v.toJson()).toList();
    }
    data['srn'] = this.srn;
    data['iopr'] = this.iopr;
    if (this.rexb != null) {
      data['rexb'] = this.rexb!.toJson();
    }
    data['rsta'] = this.rsta;
    if (this.tfcs != null) {
      data['tfcs'] = this.tfcs!.toJson();
    }
    if (this.tafcs != null) {
      data['tafcs'] = this.tafcs!.toJson();
    }
    data['checkInDate'] = this.checkInDate;
    data['checkOutDate'] = this.checkOutDate;
    return data;
  }
}

class Ti {
  String? fN;
  String? lN;
  String? pt;
  String? ti;

  Ti({this.fN, this.lN, this.pt, this.ti});

  Ti.fromJson(Map<String, dynamic> json) {
    fN = json['fN'];
    lN = json['lN'];
    pt = json['pt'];
    ti = json['ti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fN'] = this.fN;
    data['lN'] = this.lN;
    data['pt'] = this.pt;
    data['ti'] = this.ti;
    return data;
  }
}

class Pis {
  Fc? fc;
  Afc? afc;
  int? day;

  Pis({this.fc, this.afc, this.day});

  Pis.fromJson(Map<String, dynamic> json) {
    fc = json['fc'] != null ? new Fc.fromJson(json['fc']) : null;
    afc = json['afc'] != null ? new Afc.fromJson(json['afc']) : null;
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fc != null) {
      data['fc'] = this.fc!.toJson();
    }
    if (this.afc != null) {
      data['afc'] = this.afc!.toJson();
    }
    data['day'] = this.day;
    return data;
  }
}

class Fc {
  double? bF;
  double? nF;
  double? tF;
  int? cMU;
  double? tAF;

  Fc({this.bF, this.nF, this.tF, this.cMU, this.tAF});

  Fc.fromJson(Map<String, dynamic> json) {
    bF = json['BF'];
    nF = json['NF'];
    tF = json['TF'];
    cMU = json['CMU'];
    tAF = json['TAF'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BF'] = this.bF;
    data['NF'] = this.nF;
    data['TF'] = this.tF;
    data['CMU'] = this.cMU;
    data['TAF'] = this.tAF;
    return data;
  }
}

class Afc {
  TAF? tAF;

  Afc({this.tAF});

  Afc.fromJson(Map<String, dynamic> json) {
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
  String? mF;
  String? mFT;
  String? sAC;
  String? sBP;
  String? sGP;
  String? sNP;
  String? sRC;
  String? tMF;
  String? tSF;
  String? cGST;
  String? sGST;
  String? tTSF;

  TAF(
      {this.mF,
        this.mFT,
        this.sAC,
        this.sBP,
        this.sGP,
        this.sNP,
        this.sRC,
        this.tMF,
        this.tSF,
        this.cGST,
        this.sGST,
        this.tTSF});

  TAF.fromJson(Map<String, dynamic> json) {
    mF = json['MF'].toString();
    mFT = json['MFT'].toString();
    sAC = json['SAC'].toString();
    sBP = json['SBP'].toString();
    sGP = json['SGP'].toString();
    sNP = json['SNP'].toString();
    sRC = json['SRC'].toString();
    tMF = json['TMF'].toString();
    tSF = json['TSF'].toString();
    cGST = json['CGST'].toString();
    sGST = json['SGST'].toString();
    tTSF = json['TTSF'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MF'] = this.mF;
    data['MFT'] = this.mFT;
    data['SAC'] = this.sAC;
    data['SBP'] = this.sBP;
    data['SGP'] = this.sGP;
    data['SNP'] = this.sNP;
    data['SRC'] = this.sRC;
    data['TMF'] = this.tMF;
    data['TSF'] = this.tSF;
    data['CGST'] = this.cGST;
    data['SGST'] = this.sGST;
    data['TTSF'] = this.tTSF;
    return data;
  }
}

class Rexb {
  List<BENEFIT>? bENEFIT;

  Rexb({this.bENEFIT});

  Rexb.fromJson(Map<String, dynamic> json) {
    if (json['BENEFIT'] != null) {
      bENEFIT = <BENEFIT>[];
      json['BENEFIT'].forEach((v) {
        bENEFIT!.add(new BENEFIT.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bENEFIT != null) {
      data['BENEFIT'] = this.bENEFIT!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BENEFIT {
  List<String>? values;

  BENEFIT({this.values});

  BENEFIT.fromJson(Map<String, dynamic> json) {
    values = json['values'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['values'] = this.values;
    return data;
  }
}

class Tfcs {
  String? bF;
  String? nF;
  String? tF;
  String? cMU;
  String? tAF;

  Tfcs({this.bF, this.nF, this.tF, this.cMU, this.tAF});

  Tfcs.fromJson(Map<String, dynamic> json) {
    bF = json['BF'].toString();
    nF = json['NF'].toString();
    tF = json['TF'].toString();
    cMU = json['CMU'].toString();
    tAF = json['TAF'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BF'] = this.bF;
    data['NF'] = this.nF;
    data['TF'] = this.tF;
    data['CMU'] = this.cMU;
    data['TAF'] = this.tAF;
    return data;
  }
}



class Query {
  List<RoomInfo>? roomInfo;
  String? checkinDate;
  String? checkoutDate;
  SearchCriteria? searchCriteria;
  bool? isSearchCompleted;
  SearchPreferences? searchPreferences;

  Query(
      {this.roomInfo,
        this.checkinDate,
        this.checkoutDate,
        this.searchCriteria,
        this.isSearchCompleted,
        this.searchPreferences});

  Query.fromJson(Map<String, dynamic> json) {
    if (json['roomInfo'] != null) {
      roomInfo = <RoomInfo>[];
      json['roomInfo'].forEach((v) {
        roomInfo!.add(new RoomInfo.fromJson(v));
      });
    }
    checkinDate = json['checkinDate'];
    checkoutDate = json['checkoutDate'];
    searchCriteria = json['searchCriteria'] != null
        ? new SearchCriteria.fromJson(json['searchCriteria'])
        : null;
    isSearchCompleted = json['isSearchCompleted'];
    searchPreferences = json['searchPreferences'] != null
        ? new SearchPreferences.fromJson(json['searchPreferences'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roomInfo != null) {
      data['roomInfo'] = this.roomInfo!.map((v) => v.toJson()).toList();
    }
    data['checkinDate'] = this.checkinDate;
    data['checkoutDate'] = this.checkoutDate;
    if (this.searchCriteria != null) {
      data['searchCriteria'] = this.searchCriteria!.toJson();
    }
    data['isSearchCompleted'] = this.isSearchCompleted;
    if (this.searchPreferences != null) {
      data['searchPreferences'] = this.searchPreferences!.toJson();
    }
    return data;
  }
}

class RoomInfo {
  int? numberOfChild;
  int? numberOfAdults;

  RoomInfo({this.numberOfChild, this.numberOfAdults});

  RoomInfo.fromJson(Map<String, dynamic> json) {
    numberOfChild = json['numberOfChild'];
    numberOfAdults = json['numberOfAdults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numberOfChild'] = this.numberOfChild;
    data['numberOfAdults'] = this.numberOfAdults;
    return data;
  }
}

class SearchCriteria {
  String? city;
  String? countryName;
  String? nationality;

  SearchCriteria({this.city, this.countryName, this.nationality});

  SearchCriteria.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    countryName = json['countryName'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['countryName'] = this.countryName;
    data['nationality'] = this.nationality;
    return data;
  }
}

class SearchPreferences {
  String? currency;

  SearchPreferences({this.currency});

  SearchPreferences.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    return data;
  }
}
