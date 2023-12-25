import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:razorpay_flutter/razorpay_flutter.dart';

String razorPayKey="rzp_test_UUBtmcArqOLqIY";
String razorPaySecret="NTW3MUbXOtcwUrz5a4YCshqk";
 const chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
class RazorPayHelper {
  String amount;
  String? orderId;


  ValueChanged onResult;
  Razorpay? _razorpay;
  RazorPayHelper(this.amount, this.onResult);


  init() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getOrder();
  }

  void getOrder() async {
    String username = razorPayKey;
    String password = razorPaySecret;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    double newmoney = double.parse(amount.toString()) * 100;
    int nw = newmoney.toInt();

    Map data = {
      "amount": nw.toString(),
      "currency": "INR",
      "receipt": "receipt_" + getRandomString(5)
    }; // as per my experience the receipt doesn't play any role in helping you generate a certain pattern in your Order ID!!
    var headers = {"content-type": "application/json"};
    var res = await http.post(Uri.parse('https://api.razorpay.com/v1/orders'),
        headers: <String, String>{'authorization': basicAuth}, body: data);

    if (res.statusCode == 200) {
      Map data2 = json.decode(res.body);
      orderId = data2['id'];
      openCheckout(amount);
    } else {

    }
  }

  void openCheckout(String amt) async {
    var options = {
      'key': razorPayKey,
      'amount': amt,
      'name': 'Parry Trip',
      "order_id": orderId,
      'description': "Order #" + getRandomString(5),
      'external': {
        'wallets': ['paytm']
      },
      // 'prefill': {
      //   'name': currentUser.value.fullName,
      //   'contact': currentUser.value.phone,
      //   'email': currentUser.value.email,
      // },
      "notify": {"sms": true, "email": true},
      "reminder_enable": true,
    };
      print(options);
    try {
      _razorpay!.open(options);
    } catch (e) {

    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onResult(response.paymentId.toString() +
        "-" +
        response.orderId.toString() +
        "-" +
        response.signature.toString());
    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    onResult("error");
    // Get.showSnackbar(Ui.ErrorSnackBar(message: "Payment Cancelled"));
    //setSnackbar("ERROR: " + response.code.toString() + " - " + response.message.toString(), context);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    onResult(response.walletName.toString() + "-" + orderId.toString());
  }
}
