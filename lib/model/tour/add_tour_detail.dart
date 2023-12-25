import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';
import 'package:parry_trip2/model/tour/tour_detail_model.dart';
import 'package:parry_trip2/screens/bottomNavBar/bottom_Nav_bar.dart';
import 'package:parry_trip2/widgets/Razorpay.dart';
import 'package:http/http.dart' as http;
class AddTourDetail extends StatefulWidget {
  
  Map param;
  Map response;
  TourDetailModel model;


  AddTourDetail(this.param, this.response, this.model);

  @override
  State<AddTourDetail> createState() => _AddTourDetailState();
}

class _AddTourDetailState extends State<AddTourDetail> {

  double totalPrice = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPrice = double.parse(widget.param['total_price']);
  }
  List<String> typeList  = ["Cash","Online"];
  TextEditingController firstCon = TextEditingController();
  TextEditingController lastCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController address1Con = TextEditingController();
  TextEditingController address2Con = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController zipCodeCon = TextEditingController();
  TextEditingController countryCon = TextEditingController();
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
          "Add User Detail",
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
              const Text(
                "Personal Info",
                style:  TextStyle(
                  fontFamily: "open-sans",
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
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
                  ),
                ],
              ),
              const SizedBox(height:10,),
              TextFormField(
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
              const SizedBox(height:10,),
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
             /* TextFormField(
                controller: address1Con,
                minLines: 3,
                maxLines: 5,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Address Line1",
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
                controller: address2Con,
                minLines: 3,
                maxLines: 5,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Address Line 2",
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
              const SizedBox(height:10,),*/
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: cityCon,

                      style: Theme.of(context).textTheme.subtitle2,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "City",
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
                      controller: zipCodeCon,
                      style: Theme.of(context).textTheme.subtitle2,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Pin Code/Zip Code",
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
                controller: stateCon,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "State",
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
                controller: countryCon,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Country",
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
              const SizedBox(height:10,),*/
              TextFormField(
                controller: specialCon,
                minLines: 4,
                maxLines: 6,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Special Requirement",
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
              const Text(
                "Payment Info",
                style:  TextStyle(
                  fontFamily: "open-sans",
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height:20,),
              Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                runSpacing: 10,
                children: typeList.map((e) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                        value: e,
                        groupValue: selectedRadio,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          partial = false;
                          setState(() {
                            selectedRadio = e;
                          });
                        },
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        e,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!,
                      ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height:20,),
              selectedRadio=="Online"?CheckboxListTile(
                dense: true,
                title:Text("Partial Payment(50% Amount)",style: Theme.of(context).textTheme.labelLarge,),
                value: partial,
                onChanged: (value) {
                  setState(() {
                    partial = value!;
                  });
                },
                activeColor: AppColor.activeColor,
                controlAffinity:
                ListTileControlAffinity.leading,
              ):const SizedBox(),
              const SizedBox(height:20,),
              CheckboxListTile(
                dense: true,
                title: privacyPolicyLinkAndTermsOfService(),
                value: acceptTerms,
                onChanged: (value) {
                  setState(() {
                    acceptTerms = value!;
                  });
                },
                activeColor: AppColor.activeColor,
                controlAffinity:
                ListTileControlAffinity.leading,
              ),
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
              if(phoneCon.text == ""||phoneCon.text.length!=10){
                Common().toast("Please Enter Valid Mobile Number");
                return;
              }
              if(emailCon.text != ""&&!emailCon.text.contains("@")){
                Common().toast("Please Enter Valid Email Address");
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
              if(cityCon.text == ""){
                Common().toast("Please Enter City");
                return;
              }
              if(zipCodeCon.text == ""){
                Common().toast("Please Enter Zip Code");
                return;
              }
              /*if(stateCon.text == ""){
                Common().toast("Please Enter State");
                return;
              }
              if(countryCon.text == ""){
                Common().toast("Please Enter Country");
                return;
              }*/
              if(!acceptTerms){
                Common().toast("Please Accepts Terms and Conditions");
                return;
              }
              showDialog(context: context, builder: (ctx){
                return Dialog(
                  child: StatefulBuilder(
                      builder: (context,setState) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height:10,),
                              Text(
                                "${widget.model.row!.title}",
                                style:const  TextStyle(
                                  fontFamily: 'open-sans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,

                                ),
                              ),
                              const SizedBox(height:10,),
                              Row(children: [
                                const Icon(Icons.location_on_outlined,color: Colors.black54, size: 20,),
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: Text(
                                    widget.model.row!.location?.name ?? '',
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    style:const TextStyle(
                                      fontFamily: "open-sans",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )
                              ],),
                              const SizedBox(height:20,),
                              TextFormField(
                                initialValue: widget.param['start_date'],
                                readOnly: true,
                                style: Theme.of(context).textTheme.subtitle2,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelText: "Start Date",
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
                              widget.model.row!.meta!.enablePersonTypes==1?Column(
                                children: widget.model.bookingData!.personTypes!.map((e) {
                                  int index = widget.model.bookingData!.personTypes!.indexWhere((element) => element.name==e.name);

                                  return ListTile(
                                    leading: Text(
                                      "${e.name}",
                                      style:const  TextStyle(
                                        fontFamily: 'open-sans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,

                                      ),
                                    ),
                                    contentPadding:const EdgeInsets.symmetric(vertical: 4),
                                    horizontalTitleGap: 1,
                                    title:  Text(
                                      "${e.count}X${e.price}",
                                      style:const  TextStyle(
                                        fontFamily: 'open-sans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                    ),

                                    trailing: Text(
                                      "₹${double.parse(e.count!)*double.parse(e.price!)}",
                                      style: const TextStyle(
                                        fontFamily: 'open-sans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  );}).toList(),
                              ):const SizedBox(),
                              const SizedBox(height:10,),
                              widget.model.row!.meta!.enableExtraPrice==1?const Text(
                                "Extra Price",
                                style:  TextStyle(
                                  fontFamily: "open-sans",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ):const SizedBox(),
                              const SizedBox(height:5,),
                              widget.model.row!.meta!.enableExtraPrice==1?Column(
                                children: widget.model.bookingData!.extraPrice!.map((e) =>  e.checked!?ListTile(
                                  contentPadding:const EdgeInsets.symmetric(vertical: 4),
                                  horizontalTitleGap: 1,
                                  title:  Text(
                                    "${e.name}",
                                    style:  TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                  trailing: Text(
                                    "₹${e.price}",
                                    style: const TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                ):SizedBox()).toList(),
                              ):const SizedBox(),
                              const SizedBox(height:10,),
                              Column(
                                children: widget.model.bookingData!.buyerFees!.map((e) =>  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.name!,
                                      style: const TextStyle(
                                        fontFamily: 'open-sans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,

                                      ),
                                    ),
                                    Text(
                                      "₹${e.price}" ?? "",
                                      style: const TextStyle(
                                        fontFamily: 'open-sans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,

                                      ),
                                    ),
                                  ],
                                ),).toList(),
                              ),
                              SizedBox(height:partial?10:0,),
                              partial?Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Left Amount",
                                    style:  TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                  Text(
                                    "₹${totalPrice~/2}" ?? "",
                                    style: const TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                ],
                              ):const SizedBox(),
                              SizedBox(height:partial?10:0,),
                              partial?Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Pay Now",
                                    style:  TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                  Text(
                                    "₹${totalPrice~/2}" ?? "",
                                    style: const TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                ],
                              ):const SizedBox(),
                              const SizedBox(height:10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Price",
                                    style:  TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                  Text(
                                    "₹$totalPrice" ?? "",
                                    style: const TextStyle(
                                      fontFamily: 'open-sans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,

                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height:10,),
                              InkWell(
                                onTap: (){
                                  setState((){
                                    loading = true;
                                  });
                                  Navigator.pop(context);

                                  if(selectedRadio=="Cash"){
                                    bookTour();
                                  }else{
                                    RazorPayHelper razorPay = RazorPayHelper(partial?(totalPrice~/2).toString():totalPrice.toString(), (value) {if (value.toString() == "error") {
                                      setState((){
                                        loading = false;
                                      });
                                      Common().toast("Payment Failed");
                                    } else {
                                      if (value.toString().contains("-")) {
                                         bookTour(paymentId:value.toString());
                                      } else {
                                        setState((){
                                          loading = false;
                                        });
                                        Common().toast("Payment Failed");
                                      }
                                    } });
                                    razorPay.init();
                                  }

                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "BOOK".toUpperCase(),
                                    style:const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                );
              });
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
  void bookTour({String? paymentId}) async {
    /*setState(() {
      loading = true;
    });*/
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
      "code":widget.response['booking_code'].toString(),
      "first_name":firstCon.text,
      "last_name":lastCon.text,
      "email":emailCon.text,
      "phone":phoneCon.text,
      "address_line_1":address1Con.text,
    "address_line_2":address2Con.text,
    "state":stateCon.text,
    "zip_code":zipCodeCon.text,
    "country":countryCon.text,
    "city":cityCon.text,
    "customer_notes":specialCon.text,
    "payment_gateway":selectedRadio=="Cash"?"offline_payment":"Razorpay",
      "total_price":totalPrice.toString(),

      "transaction_id":paymentId ?? "payment_id_${getRandomString(5)}",
      "term_conditions":"1",
      "coupon_code":"",
      "paid_amount":partial?(totalPrice~/2).toString():totalPrice.toString(),
      "left_amount":partial?(totalPrice~/2).toString():"0",
      "partial_payment":partial?"1":"0",
      "how_to_pay":partial?"deposit":"full",
    };
    print("${baseUrl}booking/app-do-checkout");
    print("$param");
    var response = await http.post(Uri.parse('${baseUrl}booking/app-do-checkout'),body: param, headers: headers);
    print(response.body);
    Map<String,dynamic> data = jsonDecode(response.body);
    print("$data");
    setState(() {
      loading = false;
    });
    if (response.statusCode == 200) {
      if(data['status']!=0){
        Common().toast("Booking Done");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBar()),
                (route) => false);
      }else{
        Common().toast(data['errors'].toString());
      }

    } else {
      Common().toast("Something went wrong");
    }
  }
  String selectedRadio = "Cash";
  bool acceptTerms = false;
  bool partial = false;
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
