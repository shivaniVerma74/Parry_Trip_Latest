import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';
import 'package:parry_trip2/model/fare_rule_model.dart';
import 'package:parry_trip2/model/flight_model.dart';
import 'package:parry_trip2/model/passenger_model.dart';
import 'package:parry_trip2/model/review_model.dart';
import 'package:parry_trip2/screens/FLight/FlightList.dart';
import 'package:parry_trip2/screens/FLight/seat_info_screen.dart';
import 'package:parry_trip2/screens/HomeScreen/home_screen.dart';
import 'package:parry_trip2/screens/bottomNavBar/bottom_Nav_bar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'FlightHome.dart';

class CheckOutScreen extends StatefulWidget {
  FlightModel model;
  String? adultCount, childCount, infantCount;
  List <FlightModel>? flightDataList;

  CheckOutScreen(this.model, this.adultCount, this.childCount, this.infantCount, this.flightDataList,
      {super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  TextEditingController mobileCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  FlightModel? model;
  Timer? timer;

  List<String> priceIdList = [];

  late Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    widget.flightDataList?.forEach((element) {
       priceIdList.add(element.totalPriceList?[0].id ?? '');
       print('___________${element.totalPriceList?[0].id}__________');
    });

    model = widget.model;
    getReview(/*model!.totalPriceList![0].id!*/);

    priceIdList.forEach((element) {
      getRule(element);
    });

    tabController = TabController(length: 4, vsync: this);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  String durationToString1(int seconds) {
    var d = Duration(seconds: seconds);
    List<String> parts = d.toString().split(':');
    return '${parts[1].padLeft(2, '0')}m ${double.parse(parts[2]).toStringAsFixed(0).padLeft(2, '0')}s';
  }

  int seconds = 0;
  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    // TODO: implement dispose
    super.dispose();
  }

  List<String> method = [
   // "Wallet",
    "Razorpay",
  ];
  String selectedMethod = "Razorpay";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        Navigator.pop(context);
        return Future.value();
      },
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          backgroundColor: AppColor.activeColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back_sharp)),
          title: Text(
            "Confirm Booking",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: reviewModel != null
                    ? Text(
                        "Expire - ${durationToString1(seconds)}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      )
                    : SizedBox()),
          ],
          bottom: TabBar(
            isScrollable: true,
            controller: tabController!,
            onTap: (int index) {
              if (index == 2) {
                bool validate = true;
                for (int i = 0; i < passenger.length; i++) {
                  PassengerModel element = passenger[i];
                  if (element.title == null) {
                    Fluttertoast.showToast(
                        msg: "Please Enter ${element.type!} Title");
                    validate = false;
                    break;
                  }
                  if (element.fName == null) {
                    Fluttertoast.showToast(
                        msg: "Please Enter ${element.type!} First Name");
                    validate = false;
                    break;
                  }
                  if (element.lName == null) {
                    Fluttertoast.showToast(
                        msg: "Please Enter ${element.type!} Last Name");
                    validate = false;
                    break;
                  }
                  if (element.dob.text == "" && element.dobM) {
                    Fluttertoast.showToast(
                        msg: "Please Enter ${element.type!} Date Of Birth");
                    validate = false;
                    break;
                  }
                }
                if (!validate) {
                  tabController!.animateTo(index - 1);
                  return;
                }
                if (mobileCon.text.length != 10) {
                  Fluttertoast.showToast(
                      msg: "Please Enter Valid Mobile Number");
                  tabController!.animateTo(index - 1);
                  return;
                }
                if (!emailCon.text.contains("@") ||
                    !emailCon.text.contains(".")) {
                  Fluttertoast.showToast(msg: "Please Enter Valid Email");
                  tabController!.animateTo(index - 1);
                  return;
                }
              }
              tabController!.animateTo(index);
            },
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                text: "Details",
              ),
              Tab(
                text: "Passengers",
              ),
              Tab(
                text: "Review",
              ),
              Tab(
                text: "Payment",
              ),
            ],
          ),
        ),
        body: reviewModel != null
            ? TabBarView(
                controller: tabController!,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DetailsContainer(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        FormContainer(),
                        Column(children:
                          List.generate(reviewModelList.length, (index) {
                            var item = reviewModelList[index];
                            return Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.grey)),
                              child: ExpansionTile(
                                title: Text(
                                  "Add Baggage, Meal & Other Services to Your Travel",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                children: [
                                  Divider(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  item != null &&
                                      services.length > 0 &&
                                      (item!.sI![0].meal!.isNotEmpty ||
                                          item!
                                              .sI![0].baggage!.isNotEmpty)
                                      ? ServiceContainer(item)
                                      : SizedBox(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          } )
                        ,),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey)),
                          child: ExpansionTile(
                            title: Text(
                              "Select Seats (Optional)",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            children: [
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Column(children:
                              List.generate(widget.flightDataList!.length, (index) {
                                var item = widget.flightDataList![index];
                                return Column(children: [
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.sI![0].da!.city
                                          .toString()
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0),
                                    ),
                                    Icon(Icons.arrow_forward),
                                    Text(
                                      item.sI![0].aa!.city.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateFormat.yMMMEd().format(DateTime.parse(
                                          item.sI![0].dt.toString())),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black54,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap:()async{
                                        var result = await  Navigator.push(context, MaterialPageRoute(builder: (context)=>SeatInfoScreen(reviewModel!,passenger.toList())));
                                        if(result!=null){
                                          setState(() {
                                            passenger = result['passenger'];
                                            totalSeatAmount = result['total'];
                                          });
                                        }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(8.0),
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColor.activeColor),
                                          child: Center(
                                              child: Text(
                                                "Show Seat Map",
                                                style: TextStyle(color: colors.whiteTemp),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                ],);
                                      }
                              ),),

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey)),
                          child: ExpansionTile(
                            title: Text(
                              "Contact Details",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            children: [
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: mobileCon,
                                      keyboardType: TextInputType.phone,
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        counterText: '',
                                        labelText: "Mobile Number",
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: emailCon,
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(children: List.generate(widget.flightDataList!.length, (index)  {
                            var item = widget.flightDataList![index];
                            return Column(children: [
                              Row(
                                children: [
                                  Text(
                                    "${item.sI![0].fD!.aI!.name.toString()}(${item.sI![0].fD!.aI!.code}-${item.sI![0].fD!.fN})",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item!.sI![0].da!.city.toString().toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0),
                                  ),
                                  Icon(Icons.arrow_forward),
                                  Text(
                                    item!.sI![0].aa!.city.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    DateFormat.yMMMEd().format(DateTime.parse(
                                        item!.sI![0].dt.toString())),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          getDateFormat(
                                              item!.sI![0].dt.toString()),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.0),
                                        ),
                                        Text(
                                          "${item!.sI![0].da!.city.toString()},${item!.sI![0].da!.country.toString()}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black54,
                                              fontSize: 12.0),
                                        ),
                                        Text(
                                          item!.sI![0].da!.name.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black54,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.arrow_forward),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        durationToString(int.parse(
                                            item!.sI![0].duration.toString())),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          getDateFormat(
                                              item!.sI![0].at.toString()),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.0),
                                        ),
                                        Text(
                                          "${item!.sI![0].aa!.city.toString()},${item!.sI![0].aa!.country.toString()}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black54,
                                              fontSize: 12.0),
                                        ),
                                        Text(
                                          item!.sI![0].aa!.name.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black54,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],);
                          }),),
                          Text(
                            "Passenger Details",
                            style: Theme.of(context).textTheme.titleLarge!,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              itemCount: passenger.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: Colors.grey)),
                                  child: ListTile(
                                    leading: Text(
                                      "${index + 1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!,
                                    ),
                                    title: Text(
                                      "${passenger[index].fName!} ${passenger[index].lName!}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!,
                                    ),
                                    subtitle: Text(
                                      "Seat ${passenger[index].code ?? ""}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                    ),
                                    trailing: Text(
                                      "${passenger[index].dob.text}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                    ),
                                  ),
                                );
                              }),
                          Text(
                            "Contact Details",
                            style: Theme.of(context).textTheme.titleLarge!,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email : ${emailCon.text}",
                            style: Theme.of(context).textTheme.titleMedium!,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Mobile : ${mobileCon.text}",
                            style: Theme.of(context).textTheme.titleMedium!,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Payment Method",
                          style: Theme.of(context).textTheme.titleLarge!,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: method.map((e) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedMethod = e;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: selectedMethod == e
                                        ? AppColor.activeColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color: AppColor.activeColor)),
                                padding: const EdgeInsets.all(20),
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      e,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: selectedMethod != e
                                            ? AppColor.activeColor
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
        bottomNavigationBar: reviewModel != null
            ? Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    reviewModel!.alerts != null &&
                            reviewModel!.alerts!.length > 0
                        ? Text(
                            "Price Changed",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                          )
                        : SizedBox(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Base Fare",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "₹${reviewModel!.fc!.bF}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    totalSeatAmount!="0"?Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Seat Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "₹${totalSeatAmount}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ):SizedBox(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Taxes and fees",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "₹${reviewModel!.fc!.tAF}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    serviceAmount > 0
                        ? Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Extra Services",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      serviceAmount = 0;
                                      services.clear();
                                      if (widget.adultCount != null) {
                                        for (int i = 0;
                                            i < int.parse(widget.adultCount!);
                                            i++) {
                                          services.add(ServiceModel(
                                            type: "Adult ${i + 1}",
                                          ));
                                        }
                                      }
                                      if (widget.childCount != null) {
                                        for (int i = 0;
                                            i < int.parse(widget.childCount!);
                                            i++) {
                                          services.add(ServiceModel(
                                            type: "Child ${i + 1}",
                                          ));
                                        }
                                      }
                                    });
                                  },
                                  child: Text("Clear")),
                              Expanded(
                                child: Text(
                                  "₹$serviceAmount",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    Divider(),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "₹${reviewModel!.fc!.tF! + serviceAmount+double.parse(totalSeatAmount)}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (tabController!.index != 0) {
                              tabController!
                                  .animateTo(tabController!.index - 1);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              "⇐ Back",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (tabController!.index == 3) {
                              openCheckout();
                            //  bookApi(reviewModelList.first.bookingId!);
                            }
                            if (tabController!.index != 3) {
                              bool validate = true;
                              if (tabController!.index + 1 == 2) {
                                for (int i = 0; i < passenger.length; i++) {
                                  PassengerModel element = passenger[i];
                                  if (element.title == null) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please Enter ${element.type!} Title");
                                    validate = false;
                                    break;
                                  }
                                  if (element.fName == null) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please Enter ${element.type!} First Name");
                                    validate = false;
                                    break;
                                  }
                                  if (element.lName == null) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please Enter ${element.type!} Last Name");
                                    validate = false;
                                    break;
                                  }
                                  if (element.dob.text == "" && element.dobM) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please Enter ${element.type!} Date Of Birth");
                                    validate = false;
                                    break;
                                  }
                                }
                                if (!validate) {
                                  return;
                                }
                                if (mobileCon.text.length != 10) {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter Valid Mobile Number");
                                  return;
                                }
                                if (!emailCon.text.contains("@") ||
                                    !emailCon.text.contains(".")) {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter Valid Email");
                                  return;
                                }
                              }
                              tabController!
                                  .animateTo(tabController!.index + 1);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              tabController!.index == 3 ? "Book" : "Next ⇒",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ),
    );
  }

  List<PassengerModel> passenger = [];
  List<ServiceModel> services = [];
  String totalSeatAmount = "0";
  List<String> title = ["Mr", "Mrs", "Ms"];
  List<String> childTitle = [ "Ms","Master"];
  DateTime selectedDate = DateTime.now();
  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    return picked!;
  }

  Widget ServiceContainer(ReviewModel item) {
    return Column(
      children: services.map((e) {
        int index =
            services.indexWhere((element) => element.type!.contains(e.type!));
        return Container(
          margin: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.type!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey)),
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  isExpanded: true,
                  underline: SizedBox(),
                  value: e.descB,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: item!.sI![0].baggage!
                      .map<DropdownMenuItem<String>>((SeatInfoModel e) {
                    return DropdownMenuItem<String>(
                      value: e.code,
                      child: Text(
                        "${e.desc!} @ ₹${e.amount}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Baggage Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    int selected = item!.sI![0].baggage!
                        .indexWhere((element) => element.code == value);
                    if (selected != -1) {
                      setState(() {
                        services[index].descB = value;
                        services[index].amountB =
                            item!.sI![0].baggage![selected].amount;
                        serviceAmount = 0;
                        services.forEach((element) {
                          if (element.amountM != null) {
                            serviceAmount += element.amountM!;
                          }
                          if (element.amountB != null) {
                            serviceAmount += element.amountB!;
                          }
                        });
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey)),
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  isExpanded: true,
                  underline: SizedBox(),
                  value: e.descM,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: item!.sI![0].meal!
                      .map<DropdownMenuItem<String>>((SeatInfoModel e) {
                    return DropdownMenuItem<String>(
                      value: e.code,
                      child: Text(
                        "${e.desc!} @ ₹${e.amount}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Meal Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    int selected = item!.sI![0].meal!
                        .indexWhere((element) => element.code == value);
                    if (selected != -1) {
                      setState(() {
                        services[index].descM = value;
                        services[index].amountM =
                            item!.sI![0].meal![selected].amount;
                        serviceAmount = 0;
                        services.forEach((element) {
                          if (element.amountM != null) {
                            serviceAmount += element.amountM!;
                          }
                          if (element.amountB != null) {
                            serviceAmount += element.amountB!;
                          }
                        });
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget FormContainer() {
    return Column(
      children: passenger.map((e) {
        int index =
            passenger.indexWhere((element) => element.type!.contains(e.type!));
        return Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey)),
          child: ExpansionTile(
            title: Text(
              e.type!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            children: [
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey)),
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        underline: SizedBox(),
                        value: e.title,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items:
                            e.type!.contains("Child")?childTitle.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList():title.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Title",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            passenger[index].title = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (String value) {
                        setState(() {
                          passenger[index].fName = value;
                        });
                      },
                      initialValue:passenger[index].fName ?? "" ,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "First Name",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue:passenger[index].lName ?? "" ,
                      onChanged: (String value) {
                        setState(() {
                          passenger[index].lName = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        isDense: true,
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              passenger[index].dobM
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        readOnly: true,
                        controller: passenger[index].dob,
                        onTap: () async {
                          DateTime? picked = await _selectDate(context);
                          if (picked != null) {
                            setState(() {
                              passenger[index].dob.text =
                                  DateFormat("dd/MM/yyyy").format(picked);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "Date Of Birth",
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget DetailsContainer() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: List.generate(widget.flightDataList!.length, (index) {
          var item = widget.flightDataList?[index];
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    "${item!.sI![0].fD!.aI!.name.toString()}(${item!.sI![0].fD!.aI!.code}-${item!.sI![0].fD!.fN})",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item!.sI![0].da!.city.toString().toString(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                  ),
                  Icon(Icons.arrow_forward),
                  Text(
                    item.sI![0].aa!.city.toString(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat.yMMMEd()
                        .format(DateTime.parse(item.sI![0].dt.toString())),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getDateFormat(item!.sI![0].dt.toString()),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12.0),
                        ),
                        Text(
                          "${item!.sI![0].da!.city.toString()},${item!.sI![0].da!.country.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                              fontSize: 12.0),
                        ),
                        Text(
                          item!.sI![0].da!.name.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.arrow_forward),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        durationToString(
                            int.parse(item!.sI![0].duration.toString())),
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12.0),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getDateFormat(item!.sI![0].at.toString()),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12.0),
                        ),
                        Text(
                          "${item!.sI![0].aa!.city.toString()},${item!.sI![0].aa!.country.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                              fontSize: 12.0),
                        ),
                        Text(
                          item!.sI![0].aa!.name.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${getSeat(item!.totalPriceList![0].fd!)} seat(s) left",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.orange,
                          fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      getClass(item!.totalPriceList![0].fd!),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.orange,
                          fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "CHECKIN",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          getBaggage(item!.totalPriceList![0].fd!, 0),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "CABIN",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          getBaggage(item!.totalPriceList![0].fd!, 1),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              rules != null
                  ? Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    rulesList[index]!.cANCELLATION != null
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cancellation Fee",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          rulesList[index].cANCELLATION!.dEFAULT!.policyInfo.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              fontSize: 14.0),
                        ),
                      ],
                    )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    rulesList[index].dATECHANGE != null
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date Change Fee",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          rulesList[index]!.dATECHANGE!.dEFAULT!.policyInfo!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              fontSize: 14.0),
                        ),
                      ],
                    )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    rulesList[index]!.noShow != null
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No Show",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          rulesList[index]!.noShow!.dEFAULT!.policyInfo!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              fontSize: 14.0),
                        ),
                      ],
                    )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
                  : SizedBox(),
            ],
          );
        }
        ),),
      ),
    );
  }

  double serviceAmount = 0;
  FareRule? rules;
  List <FareRule> rulesList = [] ;
  List <ReviewModel> reviewModelList = [] ;

  ReviewModel? reviewModel;
  void getReview() async {


    setState(() {
      rules = null;
    });
    var headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey
    };
    var body = {
      "priceIds": priceIdList
    };
    print(body);
    var response = await http.post(Uri.parse('${flightUrl}fms/v1/review'),
        body: jsonEncode(body), headers: headers);
    print(response.body);
    Map data = jsonDecode(response.body);
    reviewModelList.clear();
    if (data['status']['httpStatus'] == 200) {
      Map<String, dynamic> v = data as Map<String, dynamic>;
      print("data1${v.values.elementAt(0)}");
      setState(() {
        reviewModel = ReviewModel.fromJson(v);
      });
      reviewModelList.add(reviewModel!);
      seconds = reviewModel!.conditionModel!.st!;
      if (widget.adultCount != null) {
        for (int i = 0; i < int.parse(widget.adultCount!); i++) {
          passenger.add(PassengerModel(
            type: "Adult ${i + 1}",
            dob: TextEditingController(),
            dobM: reviewModel!.conditionModel!.dob!.adobr!,
          ));
          services.add(ServiceModel(
            type: "Adult ${i + 1}",
          ));
        }
      }
      if (widget.childCount != null) {
        for (int i = 0; i < int.parse(widget.childCount!); i++) {
          passenger.add(PassengerModel(
            type: "Child ${i + 1}",
            dob: TextEditingController(),
            dobM: reviewModel!.conditionModel!.dob!.cdobr!,
          ));
          services.add(ServiceModel(
            type: "Child ${i + 1}",
          ));
        }
      }
      if (widget.infantCount != null) {
        for (int i = 0; i < int.parse(widget.infantCount!); i++) {
          passenger.add(PassengerModel(
            type: "Infant ${i + 1}",
            dob: TextEditingController(),
            dobM: reviewModel!.conditionModel!.dob!.idobr!,
          ));
          services.add(ServiceModel(
            type: "Infant ${i + 1}",
          ));
        }
      }

      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (seconds == 0) {
          timer.cancel();
          Navigator.pop(context, true);
          Navigator.pop(context);
        }
        setState(() {
          seconds--;
        });
      });
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: data['errors'][0]['message']);
    }
  }


 Future <void> bookApi(String id) async {
    setState(() {
      rules = null;
    });
    var headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey
    };
    List<Map> mapList = [];
    int index = 0;
    passenger.forEach((element) {
      Map param = {
        "ti": element.title,
        "fN": element.fName,
        "lN": element.lName,
        "pt": element.type!.split(" ")[0].toUpperCase(),
      };

      if (element.code != null) {
      param['ssrSeatInfos'] = [{
      "key":reviewModel!.sI!.first.id,
      "code":element.code,
      }];
      }
      if (services[index].descB != null) {
        param['ssrBaggageInfos'] = [{
          "key":reviewModel!.sI!.first.id,
          "code":services[index].descB,
        }];
      }
      if (services[index].descM != null) {
        param['ssrMealInfos'] =[{
          "key":reviewModel!.sI!.first.id,
          "code":services[index].descM,
        }];
      }
      if (element.dob.text != "") {
        param['dob'] = element.dob.text;
      }
      mapList.add(param);
      index++;
    });
    var body = {
      "bookingId": id,
      "paymentInfos": [
        {
          "amount": reviewModel!.fc!.tF! + serviceAmount+double.parse(totalSeatAmount),
        }
      ],
      "travellerInfo": mapList,
      "deliveryInfo": {
        "emails": [emailCon.text],
        "contacts": [mobileCon.text]
      }
    };
    print(jsonEncode(body));
    print("-----surendra--------${body}");
    print("-----surendra--------${Uri.parse('${flightUrl}oms/v1/air/book')}");
    var response = await http.post(Uri.parse('${flightUrl}oms/v1/air/book'),
        body: jsonEncode(body), headers: headers);
    print("-----surendra--------${response.body}");
    Map data = jsonDecode(response.body);
    if (data['status']['httpStatus'] == 200) {
      finalBookingApi(reviewModelList.first.bookingId!,reviewModel!.fc!.tF! + serviceAmount);
      Fluttertoast.showToast(msg: "Booking Done",backgroundColor: colors.primary );


    } else {
      Fluttertoast.showToast(msg: data['errors'][0]['message']);
      print(response.reasonPhrase);
     // Fluttertoast.showToast(msg: "Session expired");
    }
  }
  finalBookingApi(String id,double? amount) async {
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer ${App.localStorage.getString("token")}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}booking/addToCart'));
    request.fields.addAll({
      'service_type': 'flight',
      'service_id': '2',
      'booking_id': id,
      'amount': amount.toString(),
      'name': ""
    });
    print('_____request.fields__surendra___${request.fields}______${request}___');

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
     var result = await response.stream.bytesToString();
     var finalResult =  jsonDecode(result);
     Navigator.pushAndRemoveUntil(
         context,
         MaterialPageRoute(builder: (context) => BottomNavBar()),
             (route) => false);


      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HotelBookedScreen()));
    }
    else {
      print(response.reasonPhrase);
    }

  }
  void getRule(String id) async {
    setState(() {
      rules = null;
    });
    var headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey
    };
    var body = {"id": id, "flowType": "SEARCH"};
    var response = await http.post(Uri.parse('${flightUrl}fms/v1/farerule'),
        body: jsonEncode(body), headers: headers);
    print(response.body);
    Map data = jsonDecode(response.body);
    if (data['status']['httpStatus'] == 200) {
      Map v = data['fareRule'];
      print(v.values.elementAt(0));
      if(v.values.elementAt(0)['fr']!=null){
        setState(() {
          rules = FareRule.fromJson(v.values.elementAt(0)['fr']);
          rulesList.add(rules!);
        });
      }

    } else {}
  }

  void openCheckout() async   {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userMobile = prefs.getString('mobile');
    String? userEmail = prefs.getString('email');

    double price1 = reviewModel!.fc!.tF! + serviceAmount;
    int price = price1.toInt();


      var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': price*100,
      'name': 'Assignment-assist',
      'description': 'Assignment-assist',
      'prefill': {'contact': '$userMobile', 'email': '$userEmail'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }



  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // RazorpayDetailApi();
    // Order_cash_ondelivery();
   await bookApi(reviewModelList.first.bookingId!);
    Fluttertoast.showToast(
        msg: "Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);


    Fluttertoast.showToast(
        msg: "Payment cancelled by user",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response)async {
    await bookApi(reviewModelList.first.bookingId!);
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
