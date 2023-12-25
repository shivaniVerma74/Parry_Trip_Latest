class BusBookModel {
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
  String? commission;
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
  int? number;
  String? paid;
  String? payNow;
  String? walletCreditUsed;
  String? walletTotalUsed;
  String? walletTransactionId;
  String? isRefundWallet;
  int? isPaid;
  String? totalBeforeDiscount;
  String? couponAmount;
  BookinDeatils? bookinDeatils;

  BusBookModel(
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

  BusBookModel.fromJson(Map<String, dynamic> json) {
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
    commission = json['commission'].toString();
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
  Error? error;
  String? traceId;
  Itinerary? itinerary;
  int? responseStatus;

  BookinDeatils(
      {this.error, this.traceId, this.itinerary, this.responseStatus});

  BookinDeatils.fromJson(Map<String, dynamic> json) {
    error = json['Error'] != null ? new Error.fromJson(json['Error']) : null;
    traceId = json['TraceId'];
    itinerary = json['Itinerary'] != null
        ? new Itinerary.fromJson(json['Itinerary'])
        : null;
    responseStatus = json['ResponseStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['Error'] = this.error!.toJson();
    }
    data['TraceId'] = this.traceId;
    if (this.itinerary != null) {
      data['Itinerary'] = this.itinerary!.toJson();
    }
    data['ResponseStatus'] = this.responseStatus;
    return data;
  }
}

class Error {
  int? errorCode;
  String? errorMessage;

  Error({this.errorCode, this.errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorCode'] = this.errorCode;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}

class Itinerary {
  int? busId;
  Price? price;
  String? origin;
  int? status;
  String? busType;
  String? routeId;
  int? sourceId;
  String? ticketNo;
  int? noOfSeats;
  List<Passenger>? passenger;
  bool? isDomestic;
  String? travelName;
  String? arrivalTime;
  int? bookingMode;
  String? destination;
  String? serviceName;
  List<CancelPolicy>? cancelPolicy;
  int? blockDuration;
  String? dateOfJourney;
  String? departureTime;
  int? destinationId;
  int? invoiceAmount;
  String? invoiceNumber;
  int? invoiceStatus;
  List<BookingHistory>? bookingHistory;
  int? invoiceCreatedBy;
  String? invoiceCreatedOn;
  String? travelOperatorPNR;
  DropingPointdetails? dropingPointdetails;
  DropingPointdetails? boardingPointdetails;
  String? invoiceCreatedByName;
  int? invoiceLastModifiedBy;
  String? invoiceLastModifiedByName;

  Itinerary(
      {this.busId,
        this.price,
        this.origin,
        this.status,
        this.busType,
        this.routeId,
        this.sourceId,
        this.ticketNo,
        this.noOfSeats,
        this.passenger,
        this.isDomestic,
        this.travelName,
        this.arrivalTime,
        this.bookingMode,
        this.destination,
        this.serviceName,
        this.cancelPolicy,
        this.blockDuration,
        this.dateOfJourney,
        this.departureTime,
        this.destinationId,
        this.invoiceAmount,
        this.invoiceNumber,
        this.invoiceStatus,
        this.bookingHistory,
        this.invoiceCreatedBy,
        this.invoiceCreatedOn,
        this.travelOperatorPNR,
        this.dropingPointdetails,
        this.boardingPointdetails,
        this.invoiceCreatedByName,
        this.invoiceLastModifiedBy,
        this.invoiceLastModifiedByName});

  Itinerary.fromJson(Map<String, dynamic> json) {
    busId = json['BusId'];
    price = json['Price'] != null ? new Price.fromJson(json['Price']) : null;
    origin = json['Origin'];
    status = json['Status'];
    busType = json['BusType'];
    routeId = json['RouteId'];
    sourceId = json['SourceId'];
    ticketNo = json['TicketNo'];
    noOfSeats = json['NoOfSeats'];
    if (json['Passenger'] != null) {
      passenger = <Passenger>[];
      json['Passenger'].forEach((v) {
        passenger!.add(new Passenger.fromJson(v));
      });
    }
    isDomestic = json['IsDomestic'];
    travelName = json['TravelName'];
    arrivalTime = json['ArrivalTime'];
    bookingMode = json['BookingMode'];
    destination = json['Destination'];
    serviceName = json['ServiceName'];
    if (json['CancelPolicy'] != null) {
      cancelPolicy = <CancelPolicy>[];
      json['CancelPolicy'].forEach((v) {
        cancelPolicy!.add(new CancelPolicy.fromJson(v));
      });
    }
    blockDuration = json['BlockDuration'];
    dateOfJourney = json['DateOfJourney'];
    departureTime = json['DepartureTime'];
    destinationId = json['DestinationId'];
    invoiceAmount = json['InvoiceAmount'];
    invoiceNumber = json['InvoiceNumber'];
    invoiceStatus = json['InvoiceStatus'];
    if (json['BookingHistory'] != null) {
      bookingHistory = <BookingHistory>[];
      json['BookingHistory'].forEach((v) {
        bookingHistory!.add(new BookingHistory.fromJson(v));
      });
    }
    invoiceCreatedBy = json['InvoiceCreatedBy'];
    invoiceCreatedOn = json['InvoiceCreatedOn'];
    travelOperatorPNR = json['TravelOperatorPNR'];
    dropingPointdetails = json['DropingPointdetails'] != null
        ? new DropingPointdetails.fromJson(json['DropingPointdetails'])
        : null;
    boardingPointdetails = json['BoardingPointdetails'] != null
        ? new DropingPointdetails.fromJson(json['BoardingPointdetails'])
        : null;
    invoiceCreatedByName = json['InvoiceCreatedByName'];
    invoiceLastModifiedBy = json['InvoiceLastModifiedBy'];
    invoiceLastModifiedByName = json['InvoiceLastModifiedByName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BusId'] = this.busId;
    if (this.price != null) {
      data['Price'] = this.price!.toJson();
    }
    data['Origin'] = this.origin;
    data['Status'] = this.status;
    data['BusType'] = this.busType;
    data['RouteId'] = this.routeId;
    data['SourceId'] = this.sourceId;
    data['TicketNo'] = this.ticketNo;
    data['NoOfSeats'] = this.noOfSeats;
    if (this.passenger != null) {
      data['Passenger'] = this.passenger!.map((v) => v.toJson()).toList();
    }
    data['IsDomestic'] = this.isDomestic;
    data['TravelName'] = this.travelName;
    data['ArrivalTime'] = this.arrivalTime;
    data['BookingMode'] = this.bookingMode;
    data['Destination'] = this.destination;
    data['ServiceName'] = this.serviceName;
    if (this.cancelPolicy != null) {
      data['CancelPolicy'] = this.cancelPolicy!.map((v) => v.toJson()).toList();
    }
    data['BlockDuration'] = this.blockDuration;
    data['DateOfJourney'] = this.dateOfJourney;
    data['DepartureTime'] = this.departureTime;
    data['DestinationId'] = this.destinationId;
    data['InvoiceAmount'] = this.invoiceAmount;
    data['InvoiceNumber'] = this.invoiceNumber;
    data['InvoiceStatus'] = this.invoiceStatus;
    if (this.bookingHistory != null) {
      data['BookingHistory'] =
          this.bookingHistory!.map((v) => v.toJson()).toList();
    }
    data['InvoiceCreatedBy'] = this.invoiceCreatedBy;
    data['InvoiceCreatedOn'] = this.invoiceCreatedOn;
    data['TravelOperatorPNR'] = this.travelOperatorPNR;
    if (this.dropingPointdetails != null) {
      data['DropingPointdetails'] = this.dropingPointdetails!.toJson();
    }
    if (this.boardingPointdetails != null) {
      data['BoardingPointdetails'] = this.boardingPointdetails!.toJson();
    }
    data['InvoiceCreatedByName'] = this.invoiceCreatedByName;
    data['InvoiceLastModifiedBy'] = this.invoiceLastModifiedBy;
    data['InvoiceLastModifiedByName'] = this.invoiceLastModifiedByName;
    return data;
  }
}

class Price {
  GST? gST;
  int? tDS;
  int? tax;
  int? discount;
  String? basePrice;
  int? agentMarkUp;
  String? currencyCode;
  String? offeredPrice;
  int? otherCharges;
  String? publishedPrice;
  int? agentCommission;
  int? offeredPriceRoundedOff;
  int? publishedPriceRoundedOff;

  Price(
      {this.gST,
        this.tDS,
        this.tax,
        this.discount,
        this.basePrice,
        this.agentMarkUp,
        this.currencyCode,
        this.offeredPrice,
        this.otherCharges,
        this.publishedPrice,
        this.agentCommission,
        this.offeredPriceRoundedOff,
        this.publishedPriceRoundedOff});

  Price.fromJson(Map<String, dynamic> json) {
    gST = json['GST'] != null ? new GST.fromJson(json['GST']) : null;
    tDS = json['TDS'];
    tax = json['Tax'];
    discount = json['Discount'];
    basePrice = json['BasePrice'].toString();
    agentMarkUp = json['AgentMarkUp'];
    currencyCode = json['CurrencyCode'];
    offeredPrice = json['OfferedPrice'].toString();
    otherCharges = json['OtherCharges'];
    publishedPrice = json['PublishedPrice'].toString();
    agentCommission = json['AgentCommission'];
    offeredPriceRoundedOff = json['OfferedPriceRoundedOff'];
    publishedPriceRoundedOff = json['PublishedPriceRoundedOff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gST != null) {
      data['GST'] = this.gST!.toJson();
    }
    data['TDS'] = this.tDS;
    data['Tax'] = this.tax;
    data['Discount'] = this.discount;
    data['BasePrice'] = this.basePrice;
    data['AgentMarkUp'] = this.agentMarkUp;
    data['CurrencyCode'] = this.currencyCode;
    data['OfferedPrice'] = this.offeredPrice;
    data['OtherCharges'] = this.otherCharges;
    data['PublishedPrice'] = this.publishedPrice;
    data['AgentCommission'] = this.agentCommission;
    data['OfferedPriceRoundedOff'] = this.offeredPriceRoundedOff;
    data['PublishedPriceRoundedOff'] = this.publishedPriceRoundedOff;
    return data;
  }
}

class GST {
  int? cGSTRate;
  int? cessRate;
  int? iGSTRate;
  int? sGSTRate;
  int? cGSTAmount;
  int? cessAmount;
  int? iGSTAmount;
  int? sGSTAmount;
  int? taxableAmount;

  GST(
      {this.cGSTRate,
        this.cessRate,
        this.iGSTRate,
        this.sGSTRate,
        this.cGSTAmount,
        this.cessAmount,
        this.iGSTAmount,
        this.sGSTAmount,
        this.taxableAmount});

  GST.fromJson(Map<String, dynamic> json) {
    cGSTRate = json['CGSTRate'];
    cessRate = json['CessRate'];
    iGSTRate = json['IGSTRate'];
    sGSTRate = json['SGSTRate'];
    cGSTAmount = json['CGSTAmount'];
    cessAmount = json['CessAmount'];
    iGSTAmount = json['IGSTAmount'];
    sGSTAmount = json['SGSTAmount'];
    taxableAmount = json['TaxableAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CGSTRate'] = this.cGSTRate;
    data['CessRate'] = this.cessRate;
    data['IGSTRate'] = this.iGSTRate;
    data['SGSTRate'] = this.sGSTRate;
    data['CGSTAmount'] = this.cGSTAmount;
    data['CessAmount'] = this.cessAmount;
    data['IGSTAmount'] = this.iGSTAmount;
    data['SGSTAmount'] = this.sGSTAmount;
    data['TaxableAmount'] = this.taxableAmount;
    return data;
  }
}

class Passenger {
  int? age;
  String? city;
  Seat? seat;
  String? email;
  String? state;
  String? title;
  int? gender;
  String? idType;
  String? address;
  String? phoneno;
  String? idNumber;
  String? lastName;
  String? firstName;
  bool? leadPassenger;

  Passenger(
      {this.age,
        this.city,
        this.seat,
        this.email,
        this.state,
        this.title,
        this.gender,
        this.idType,
        this.address,
        this.phoneno,
        this.idNumber,
        this.lastName,
        this.firstName,
        this.leadPassenger});

  Passenger.fromJson(Map<String, dynamic> json) {
    age = json['Age'];
    city = json['City'];
    seat = json['Seat'] != null ? new Seat.fromJson(json['Seat']) : null;
    email = json['Email'];
    state = json['State'];
    title = json['Title'];
    gender = json['Gender'];
    idType = json['IdType'];
    address = json['Address'];
    phoneno = json['Phoneno'];
    idNumber = json['IdNumber'];
    lastName = json['LastName'];
    firstName = json['FirstName'];
    leadPassenger = json['LeadPassenger'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Age'] = this.age;
    data['City'] = this.city;
    if (this.seat != null) {
      data['Seat'] = this.seat!.toJson();
    }
    data['Email'] = this.email;
    data['State'] = this.state;
    data['Title'] = this.title;
    data['Gender'] = this.gender;
    data['IdType'] = this.idType;
    data['Address'] = this.address;
    data['Phoneno'] = this.phoneno;
    data['IdNumber'] = this.idNumber;
    data['LastName'] = this.lastName;
    data['FirstName'] = this.firstName;
    data['LeadPassenger'] = this.leadPassenger;
    return data;
  }
}

class Seat {
  Price? price;
  int? seatId;
  bool? isUpper;
  int? seatFare;
  String? seatName;
  int? seatType;
  bool? seatStatus;
  bool? isMalesSeat;
  bool? isLadiesSeat;

  Seat(
      {this.price,
        this.seatId,
        this.isUpper,
        this.seatFare,
        this.seatName,
        this.seatType,
        this.seatStatus,
        this.isMalesSeat,
        this.isLadiesSeat});

  Seat.fromJson(Map<String, dynamic> json) {
    price = json['Price'] != null ? new Price.fromJson(json['Price']) : null;
    seatId = json['SeatId'];
    isUpper = json['IsUpper'];
    seatFare = json['SeatFare'];
    seatName = json['SeatName'];
    seatType = json['SeatType'];
    seatStatus = json['SeatStatus'];
    isMalesSeat = json['IsMalesSeat'];
    isLadiesSeat = json['IsLadiesSeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['Price'] = this.price!.toJson();
    }
    data['SeatId'] = this.seatId;
    data['IsUpper'] = this.isUpper;
    data['SeatFare'] = this.seatFare;
    data['SeatName'] = this.seatName;
    data['SeatType'] = this.seatType;
    data['SeatStatus'] = this.seatStatus;
    data['IsMalesSeat'] = this.isMalesSeat;
    data['IsLadiesSeat'] = this.isLadiesSeat;
    return data;
  }
}

class CancelPolicy {
  String? toDate;
  String? fromDate;
  String? policyString;
  String? timeBeforeDept;
  int? cancellationCharge;
  int? cancellationChargeType;

  CancelPolicy(
      {this.toDate,
        this.fromDate,
        this.policyString,
        this.timeBeforeDept,
        this.cancellationCharge,
        this.cancellationChargeType});

  CancelPolicy.fromJson(Map<String, dynamic> json) {
    toDate = json['ToDate'];
    fromDate = json['FromDate'];
    policyString = json['PolicyString'];
    timeBeforeDept = json['TimeBeforeDept'];
    cancellationCharge = json['CancellationCharge'];
    cancellationChargeType = json['CancellationChargeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ToDate'] = this.toDate;
    data['FromDate'] = this.fromDate;
    data['PolicyString'] = this.policyString;
    data['TimeBeforeDept'] = this.timeBeforeDept;
    data['CancellationCharge'] = this.cancellationCharge;
    data['CancellationChargeType'] = this.cancellationChargeType;
    return data;
  }
}

class BookingHistory {
  String? remarks;
  int? createdBy;
  String? createdOn;
  String? createdByName;
  int? eventCategory;
  int? lastModifiedBy;
  String? lastModifiedOn;
  String? lastModifiedByName;

  BookingHistory(
      {this.remarks,
        this.createdBy,
        this.createdOn,
        this.createdByName,
        this.eventCategory,
        this.lastModifiedBy,
        this.lastModifiedOn,
        this.lastModifiedByName});

  BookingHistory.fromJson(Map<String, dynamic> json) {
    remarks = json['Remarks'];
    createdBy = json['CreatedBy'];
    createdOn = json['CreatedOn'];
    createdByName = json['CreatedByName'];
    eventCategory = json['EventCategory'];
    lastModifiedBy = json['LastModifiedBy'];
    lastModifiedOn = json['LastModifiedOn'];
    lastModifiedByName = json['LastModifiedByName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Remarks'] = this.remarks;
    data['CreatedBy'] = this.createdBy;
    data['CreatedOn'] = this.createdOn;
    data['CreatedByName'] = this.createdByName;
    data['EventCategory'] = this.eventCategory;
    data['LastModifiedBy'] = this.lastModifiedBy;
    data['LastModifiedOn'] = this.lastModifiedOn;
    data['LastModifiedByName'] = this.lastModifiedByName;
    return data;
  }
}

class DropingPointdetails {
  String? cityPointName;
  String? cityPointTime;
  String? cityPointAddress;
  String? cityPointLandmark;
  String? cityPointLocation;
  String? cityPointContactNumber;

  DropingPointdetails(
      {this.cityPointName,
        this.cityPointTime,
        this.cityPointAddress,
        this.cityPointLandmark,
        this.cityPointLocation,
        this.cityPointContactNumber});

  DropingPointdetails.fromJson(Map<String, dynamic> json) {
    cityPointName = json['CityPointName'];
    cityPointTime = json['CityPointTime'];
    cityPointAddress = json['CityPointAddress'];
    cityPointLandmark = json['CityPointLandmark'];
    cityPointLocation = json['CityPointLocation'];
    cityPointContactNumber = json['CityPointContactNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CityPointName'] = this.cityPointName;
    data['CityPointTime'] = this.cityPointTime;
    data['CityPointAddress'] = this.cityPointAddress;
    data['CityPointLandmark'] = this.cityPointLandmark;
    data['CityPointLocation'] = this.cityPointLocation;
    data['CityPointContactNumber'] = this.cityPointContactNumber;
    return data;
  }
}
