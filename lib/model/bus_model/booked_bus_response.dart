// To parse this JSON data, do
//
//     final busBookedResponse = busBookedResponseFromJson(jsonString);

import 'dart:convert';

BusBookedResponse busBookedResponseFromJson(String str) => BusBookedResponse.fromJson(json.decode(str));

String busBookedResponseToJson(BusBookedResponse data) => json.encode(data.toJson());

class BusBookedResponse {
  BookResult? bookResult;

  BusBookedResponse({
    this.bookResult,
  });

  factory BusBookedResponse.fromJson(Map<String, dynamic> json) => BusBookedResponse(
    bookResult: BookResult.fromJson(json["BookResult"]),
  );

  Map<String, dynamic> toJson() => {
    "BookResult": bookResult!.toJson(),
  };
}

class BookResult {
  int? responseStatus;
  Error? error;
  String? traceId;
  String? busBookingStatus;
  int? invoiceAmount;
  String? invoiceNumber;
  int? busId;
  String? ticketNo;
  String? travelOperatorPnr;

  BookResult({
    this.responseStatus,
    this.error,
    this.traceId,
    this.busBookingStatus,
    this.invoiceAmount,
    this.invoiceNumber,
    this.busId,
    this.ticketNo,
    this.travelOperatorPnr,
  });

  factory BookResult.fromJson(Map<String, dynamic> json) => BookResult(
    responseStatus: json["ResponseStatus"],
    error: Error.fromJson(json["Error"]),
    traceId: json["TraceId"],
    busBookingStatus: json["BusBookingStatus"],
    invoiceAmount: json["InvoiceAmount"],
    invoiceNumber: json["InvoiceNumber"],
    busId: json["BusId"],
    ticketNo: json["TicketNo"],
    travelOperatorPnr: json["TravelOperatorPNR"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseStatus": responseStatus,
    "Error": error!.toJson(),
    "TraceId": traceId,
    "BusBookingStatus": busBookingStatus,
    "InvoiceAmount": invoiceAmount,
    "InvoiceNumber": invoiceNumber,
    "BusId": busId,
    "TicketNo": ticketNo,
    "TravelOperatorPNR": travelOperatorPnr,
  };
}

class Error {
  int? errorCode;
  String? errorMessage;

  Error({
    this.errorCode,
    this.errorMessage,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    errorCode: json["ErrorCode"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "ErrorCode": errorCode,
    "ErrorMessage": errorMessage,
  };
}
