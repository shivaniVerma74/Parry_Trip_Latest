import 'package:flutter/cupertino.dart';

class PassengerModel {
  String? title;
  String? fName;
  String? lName;
  String? key;
  String? code;
  String? amount;

  TextEditingController dob;
  String? type;
  bool dobM;
  bool selected;
  PassengerModel(
      {this.title,
      this.fName,
      this.lName,
        this.key,
        this.code,
        this.amount,

        this.selected = false,
      required this.dob,
      this.type,
      this.dobM = false});
}

class ServiceModel {
  String? type;
  String? descM, descB;
  double? amountM, amountB;

  ServiceModel({this.type, this.descM, this.descB, this.amountM, this.amountB});
}
