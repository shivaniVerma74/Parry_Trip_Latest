import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';



import 'package:http/http.dart' as http;
import 'package:parry_trip2/model/tour/tour_detail_model.dart';
class AddEnquiry extends StatefulWidget {
  TourDetailModel model;

   AddEnquiry({super.key,required this.model});

  @override
  State<AddEnquiry> createState() => _AddEnquiryState();
}

class _AddEnquiryState extends State<AddEnquiry> {

  double totalPrice = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  TextEditingController firstCon = TextEditingController();
  TextEditingController lastCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController specialCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: Text(
          "Add Enquiry",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:20,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: firstCon,

                      style: Theme.of(context).textTheme.subtitle2,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "First Name",
                        isDense: true,
                        filled: true,
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                              Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width:5,),
                  Expanded(
                    child: TextFormField(
                      controller: lastCon,
                      style: Theme.of(context).textTheme.subtitle2,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Last Name",
                        isDense: true,
                        filled: true,
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                              Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:10,),
             /* TextFormField(
                controller: phoneCon,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Phone Number",
                  isDense: true,
                  counterText: '',
                  filled: true,
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                        Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              const SizedBox(height:10,),*/
              TextFormField(
                controller: emailCon,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Email Address",
                  isDense: true,
                  filled: true,
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                        Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              const SizedBox(height:10,),
              TextFormField(
                controller: specialCon,
                minLines: 4,
                maxLines: 6,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Notes",
                  isDense: true,
                  filled: true,
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                        Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              const SizedBox(height:20,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              if(firstCon.text == ""){
                Common().toast("Please Enter First Name");
                return;
              }
              if(lastCon.text == ""){
                Common().toast("Please Enter Last Name");
                return;
              }
              /*if(phoneCon.text == ""||phoneCon.text.length!=10){
                Common().toast("Please Enter Valid Mobile Number");
                return;
              }*/
              if(emailCon.text == ""||!emailCon.text.contains("@")){
                Common().toast("Please Enter Valid Email Address");
                return;
              }
              if(specialCon.text == ""){
                Common().toast("Please Enter Notes");
                return;
              }
              /* if(address1Con.text == ""){
                Common().toast("Please Enter Address Line1");
                return;
              }
              if(address2Con.text == ""){
                Common().toast("Please Enter Address Line2");
                return;
              }*/

              /*if(stateCon.text == ""){
                Common().toast("Please Enter State");
                return;
              }
              if(countryCon.text == ""){
                Common().toast("Please Enter Country");
                return;
              }*/
              /*if(!acceptTerms){
                Common().toast("Please Accepts Terms and Conditions");
                return;
              }*/
              addTour();
            },
            child: Container(
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: !loading?Text(
                "Submit".toUpperCase(),
                style:const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ):const CircularProgressIndicator(color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
  bool loading = false;
  void addTour() async {
    setState(() {
      loading = true;
    });
    int guestCount = 0;
    List<Map> person = [];

    /* var headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey
    };*/
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer ${App.localStorage.getString("token")}'
    };
    Map param = {

      "enquiry_name":"${firstCon.text} ${lastCon.text}",
      "last_name":lastCon.text,
      "enquiry_email":emailCon.text,
      "enquiry_note":specialCon.text,
      "service_id":widget.model.row!.id.toString(),
      "service_type":"tour",

    };
    print("${baseUrl}booking/addEnquiry");
    print("$param");
    print("$headers");
    var response = await http.post(Uri.parse('${baseUrl}booking/addEnquiry'),body: param, headers: headers);
    print(response.body);
    Map<String,dynamic> data = jsonDecode(response.body);
    print("$data");
    setState(() {
      loading = false;
    });
    if (response.statusCode == 200) {
      if(data['status']==1){
        Navigator.pop(context);
        Common().toast(data['message'].toString());
      }else{
        Common().toast(data['errors'].toString());
      }

    } else {
      Common().toast("Something went wrong");
    }
  }
  String selectedRadio = "Cash";
  bool acceptTerms = false;
  Widget privacyPolicyLinkAndTermsOfService() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Center(
          child: Text.rich(TextSpan(
              text: 'I agree to accept ',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'Terms and Conditions',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: AppColor.activeColor,
                      //decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // code to open / launch terms of service link here
                      }),
                // TextSpan(
                //     text: ' and ', style: TextStyle(
                //     fontSize: 18, color: Colors.black
                // ),
                //     children: <TextSpan>[
                //       TextSpan(
                //           text: 'Privacy Policy', style: TextStyle(
                //           fontSize: 18, color: Colors.black,
                //           decoration: TextDecoration.underline
                //       ),
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               // code to open / launch privacy policy link here
                //             }
                //       )
                //     ]
                // )
              ]))),
    );
  }
}
