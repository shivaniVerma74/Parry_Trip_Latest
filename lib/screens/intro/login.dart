import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';
import 'package:parry_trip2/screens/bottomNavBar/bottom_Nav_bar.dart';
import 'package:parry_trip2/screens/intro/verify_otp.dart';
import 'package:parry_trip2/widgets/AppBtn.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();
  int _value = 1;
  bool isMobile = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: colors.whiteTemp,
          body: Form(
            key: _registerFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.3,
                    width: MediaQuery.of(context).size.width / 1,
                    child: Stack(
                      children: [
                        Positioned(
                            height: MediaQuery.of(context).size.height / 2.3,
                            width: MediaQuery.of(context).size.width / 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/loginbg.png'),
                                      fit: BoxFit.fill)),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: colors.blackTemp,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              fillColor: MaterialStateColor.resolveWith(
                                      (states) =>  colors.activeColor),
                              activeColor:  colors.secondary,
                              groupValue: _value,
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value!;
                                  isMobile = false;
                                });
                              },
                            ),
                            const Text(
                              "Email",
                              style: TextStyle(
                                  color: colors.blackTemp, fontSize: 16),
                            ),
                            const SizedBox(height: 10,),
                            Radio(
                                value: 2,
                                fillColor: MaterialStateColor.resolveWith(
                                        (states) => colors.activeColor),
                                activeColor:   colors.secondary,
                                groupValue: _value,
                                onChanged: (int? value) {
                                  setState(() {
                                    _value = value!;
                                    isMobile = true;
                                  });
                                }),
                            // SizedBox(width: 10.0,),
                            const Text(
                              "Mobile No",
                              style: TextStyle(
                                  color: colors.blackTemp, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        isMobile == false ? Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              children: [
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined,
                                      color:
                                          colors.black54.withOpacity(0.2)),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color:
                                          colors.black54.withOpacity(0.2)),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10, top: 10)),
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return "Email is required";
                                }
                                if (!v.contains("@")) {
                                  return "Enter Valid Email Id";
                                }
                              },
                            ),
                            Divider(
                              color: colors.black54.withOpacity(0.2),
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_open_rounded,
                                      color:
                                          colors.black54.withOpacity(0.2)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color:
                                          colors.black54.withOpacity(0.2)),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10, top: 12)),
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return "Password is required";
                                }
                              },
                            ),
                              ],
                            )) : Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              children: [
                                TextFormField(
                                  maxLength: 10,
                                  controller: mobileController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mobile_friendly_sharp,
                                          color:
                                          colors.black54.withOpacity(0.2)),
                                      hintText: 'Mobile',
                                      counterText: '',
                                      hintStyle: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                          colors.black54.withOpacity(0.2)),
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
                                /*Divider(
                                  color: colors.black54.withOpacity(0.2),
                                ),*/
                                /*TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_open_rounded,
                                          color:
                                          colors.black54.withOpacity(0.2)),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                          colors.black54.withOpacity(0.2)),
                                      border: InputBorder.none,
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, top: 12)),
                                  validator: (v) {
                                    if (v!.isEmpty) {
                                      return "Password is required";
                                    }
                                  },
                                ),*/
                              ],
                            )),

                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Btn1(
                              height: 50,
                              width: 320,
                              title: 'Signin',
                              loading: loading,
                              onPress: () {
                                if(isMobile==false) {
                                  if (!emailController.text.contains("@") ||
                                      !emailController.text.contains(".")) {
                                    Fluttertoast.showToast(
                                        msg: "Please Enter Valid Email");
                                    return;
                                  }
                                  if (passwordController.text.length < 8) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please Enter Valid Password minimum character is 8");
                                    return;
                                  }
                                  setState(() {
                                    loading = true;
                                  });
                                  loginApi();
                                }else {
                                  if (mobileController.text.length !=10 || mobileController.text.contains(".")) {
                                    Fluttertoast.showToast(

                                        msg: "Please Enter Valid Mobile");
                                    return;
                                  }else {
                                    setState(() {
                                      loading = true;
                                    });
                                   sendOTP();

                                  }

                                }
                                /*if (_registerFormKey.currentState!.validate()) {

                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('All Fields are required!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                }*/
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
  String? userId;
  bool loading = false;
  void loginApi() async {
    SharedPreferences preferences = await  SharedPreferences.getInstance();
    await App.init();
    try {
      Map param = {
        "email": emailController.text,
        "password": passwordController.text,
        "device_name": Platform.isAndroid ? "Android" : "IOS",
      };
      print(param);
      var response =
          await http.post(Uri.parse("${baseUrl}auth/login"), body: param);
      Map data = jsonDecode(response.body);
      setState(() {
        loading = false;
      });
      print(response.body);

      //print(data['user']['id']);

      userId = data['user']['id'].toString();
      print('__________${data['user']['id'].toString()}_________');
      if (data['token'] !=null ) {

         App.localStorage.setString("token", data['token']);
          App.localStorage.setString("userId", userId ?? "");
         App.localStorage.setString("password", passwordController.text);

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

  void sendOTP() async{
    await App.init();
    try {
      Map param = {
        "mobile": mobileController.text,
        "device_name": Platform.isAndroid ? "Android" : "IOS",
      };
      print("${baseUrl}auth/login_with_otp");
      print(param);
      var response =
      await http.post(Uri.parse("${baseUrl}auth/login_with_otp"), body: param);
      print(response.body);
      Map data = jsonDecode(response.body);
      setState(() {
        loading = false;
      });

      if (data['status']) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VerifyOTP(mobileController.text)));
      } else {
        Fluttertoast.showToast(msg: "Invalid Mobile Number");
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
