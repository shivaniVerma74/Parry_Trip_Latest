import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/screens/bottomNavBar/bottom_Nav_bar.dart';
import 'package:parry_trip2/widgets/AppBtn.dart';
class VerifyOTP extends StatefulWidget {
  String mobile;


  VerifyOTP(this.mobile);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  TextEditingController otpCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colors.whiteTemp,
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: Text(
          "Verify Otp",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "OTP is sent to your mobile number",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 4,
              controller: otpCon,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                  fontSize: 24.0,
                  color:
                  Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mobile_friendly_sharp,
                      color:
                      colors.black54.withOpacity(0.2)),
                  hintText: 'XXXX',
                  counterText: '',
                  hintStyle: TextStyle(
                      fontSize: 24.0,
                      color:
                      colors.black54),
                  border: InputBorder.none,
                  contentPadding:
                  const EdgeInsets.only(left: 10, top: 10)),
              validator: (v) {
                if (v!.isEmpty) {
                  return "Mobile is required";
                }
                if (v.length<10) {
                  return "Enter Valid Mobile";
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Btn1(
                  height: 50,
                  width: 320,
                  title: 'Verify',
                  loading: loading,
                  onPress: () {
                    if (otpCon.text.length !=4 || otpCon.text.contains(".")) {
                      Fluttertoast.showToast(

                          msg: "Please Enter Valid OTP");
                      return;
                    }else {
                      setState(() {
                        loading = true;
                      });
                      verifyOTP();

                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
  bool loading = false;
  void verifyOTP() async{
    await App.init();
    try {
      Map param = {
        "mobile": widget.mobile,
        "otp": otpCon.text,
        "device_name": Platform.isAndroid ? "Android" : "IOS",
      };
      print("${baseUrl}auth/login_with_otp");
      print(param);
      var response =
      await http.post(Uri.parse("${baseUrl}auth/verify_otp"), body: param);
      print(response.body);
      Map data = jsonDecode(response.body);
      setState(() {
        loading = false;
      });
      String userId = data['user']['id'].toString();
      print('__________${data['user']['id'].toString()}_________');
      if (data['token'] !=null ) {

        App.localStorage.setString("token", data['token']);
        App.localStorage.setString("userId", userId ?? "");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BottomNavBar()),
                (route) => false);
      } else {
        Fluttertoast.showToast(msg: "Invalid Credentials");
      }

    } catch (e) {
      setState(() {
        loading = false;
      });
      /*Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));*/
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
