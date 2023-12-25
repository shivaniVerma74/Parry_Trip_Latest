import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:parry_trip2/constants/ApiBaseHelper.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';
import 'package:parry_trip2/model/bus_model/boardingModel.dart';
import 'package:parry_trip2/model/bus_model/bus_passenger_model.dart';
import 'package:parry_trip2/model/bus_model/bus_search_list_response.dart';
import 'package:parry_trip2/model/bus_model/seats_layout_esponse.dart';
import 'package:parry_trip2/model/passenger_model.dart';
import 'package:parry_trip2/screens/Bus/BusHome.dart';
import 'package:parry_trip2/screens/FLight/FlightList.dart';
import 'package:parry_trip2/screens/bottomNavBar/bottom_Nav_bar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../model/bus_model/seat_model.dart';

class BusBookPage extends StatefulWidget {
  String? trackId, resultIndex, from, to, boardingIndex, droppingIndex;
  BusResult? busResult;
  List<SeatInfoModel>? selectedSeat;


  BusBookPage(
      {this.busResult,
        this.trackId,
        this.resultIndex,
        this.from,
        this.to,
        this.selectedSeat,
        this.boardingIndex,
        this.droppingIndex});

  @override
  State<BusBookPage> createState() => _BusBookPageState();
}

class _BusBookPageState extends State<BusBookPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  List<List<SeatDetail>> seatLayoutList = [];
  SeatModel? seatModel;
  double pubPrice = 0,
      offerPrice = 0,
      comPrice = 0,
      tdsPrice = 0,
      totalPrice = 0;

  List<BusPassengerModel> passengerList = [];

  bool isLoading =false ;
  late Razorpay _razorpay;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // tabController = TabController(length: 3, vsync: this);
    getAmount();
    // seatLayout();
    boarding();

    for (int i = 0; i < widget.selectedSeat!.length; i++) {
      passengerList.add(BusPassengerModel(
        type: "Passenger ${i+1}",
        address: "",
        age: "",
        email: "",
        fName: "",
        lName: "",
        phone: "",
      ));
    }
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  getAmount() {
    for (int i = 0; i < widget.selectedSeat!.length; i++) {
      pubPrice += widget.selectedSeat![i].price!.publishedPrice!;
      offerPrice += widget.selectedSeat![i].price!.offeredPrice!;
      tdsPrice += widget.selectedSeat![i].price!.tDS!;
      comPrice += widget.selectedSeat![i].price!.agentCommission!;
    }
    totalPrice = offerPrice + tdsPrice + comPrice;
  }

  String? selectBoarding, selectDrop;
  List<SeatInfoModel> selectedList = [];
  String amount = "0";
  List<String> title = ["Mr", "Mrs", "Ms"];
  List<String> gender = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bus Details'),
        backgroundColor: colors.activeColor,
        /*bottom: TabBar(
          isScrollable: true,
          controller: tabController!,
          onTap: (int index) {
            tabController!.animateTo(index);
          },
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              text: "Seat Details",
            ),
            Tab(
              text: "Canc. Policy",
            ),
            Tab(
              text: "Boarding Point",
            ),
          ],
        ),*/
      ),
      bottomNavigationBar: !loading
          ? Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Published Price :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
                Expanded(
                  child: Text(
                    "₹${pubPrice}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Offered Price :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
                Expanded(
                  child: Text(
                    "₹${offerPrice}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            /*Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Comm Earned :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
                Expanded(
                  child: Text(
                    "₹${comPrice}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),*/
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "TDS :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
                Expanded(
                  child: Text(
                    "₹${tdsPrice}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Divider(),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Grand Total :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
                Expanded(
                  child: Text(
                    "₹${totalPrice}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                bool validate = true;
                for (int i = 0; i < passengerList.length; i++){
                  BusPassengerModel element = passengerList[i];

                  if (element.title == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please Enter ${element.type!} Title");
                    validate = false;
                    break;
                  }if (element.fName == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please Enter ${element.type!} First name");
                    validate = false;
                    break;
                  }if (element.lName == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please Enter ${element.type!} Last name");
                    validate = false;
                    break;
                  }if (element.gender == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please select ${element.type!} gender");
                    validate = false;
                    break;
                  }if (element.age == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please Enter ${element.type!} age");
                    validate = false;
                    break;
                  }if (element.address == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please Enter ${element.type!} address");
                    validate = false;
                    break;
                  }if (element.email == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please Enter ${element.type!} email");
                    validate = false;
                    break;
                  }if (element.phone == null) {
                    Fluttertoast.showToast(
                        msg:
                        "Please Enter ${element.type!} phone");
                    validate = false;
                    break;
                  }
                }
                if(!validate){
                  return ;
                }else{
                  blockBusApi();

                }




                /*if (selectBoarding == null) {
                        Fluttertoast.showToast(msg: "Select Boarding Point");
                        return;
                      }
                      if (selectDrop == null) {
                        Fluttertoast.showToast(msg: "Select Dropping Point");
                        return;
                      }
                      if (double.parse(amount) < 1) {
                        Fluttertoast.showToast(msg: "Select Seats");
                        return;
                      }*/
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(15),
                child:  Center(
                  child: isLoading ? const CircularProgressIndicator() : const Text(
                    "Book",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          : SizedBox(),
      body: !loading
          ? Container(
        color: Color(0xfffafafa),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colors.activeColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Travels :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                    color: colors.activeColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.busResult!.travelName!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bus Type :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                    color: colors.activeColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.busResult!.busType!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "From :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                    color: colors.activeColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.from!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                    color: colors.activeColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.to!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Depart :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                    color: colors.activeColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  getDateFormat(widget
                                      .busResult!.departureTime!
                                      .toString()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Arrival :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                    color: colors.activeColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  getDateFormat(widget
                                      .busResult!.arrivalTime!
                                      .toString()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Passenger's Details",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FormContainer(),
            ],
          ),
        ),
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  BusSeatLayoutResponse? busSeatLayoutResponse;
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  bool loading = true;
  List<BoardingModel> boardList = [];
  List<BoardingModel> dropList = [];

  Future<void> seatLayout() async {
    const String url = '${busBookingUrl}GetBusSeatLayOut';
    final Map<String, dynamic> requestBody = {
      "EndUserIp": "192.168.5.37",
      "ResultIndex": resultIndex,
      "TraceId": widget.trackId,
      "TokenId": busToken
    };
    print(requestBody);
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(requestBody));
    if (response.statusCode == 307) {
      final String? redirectedUrl = response.headers['location'];
      // Send another request to the redirected URL
      final redirectedResponse = await http.post(Uri.parse(redirectedUrl ?? ''),
          headers: headers, body: jsonEncode(requestBody));
      // Process the redirected response as needed

      print(redirectedResponse.body);
      var finalResult = jsonDecode(redirectedResponse.body);
      setState(() {
        loading = false;
      });
      if (finalResult['GetBusSeatLayOutResult']['SeatLayoutDetails'] != null) {
        seatModel = SeatModel.fromJson(
            finalResult['GetBusSeatLayOutResult']['SeatLayoutDetails']);
      } else {
        String msg =
        finalResult['GetBusSeatLayOutResult']['Error']['ErrorMessage'];
        Fluttertoast.showToast(msg: msg);
      }
    }
    // var request = http.Request('POST', Uri.parse('http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/GetBusSeatLayOut'));
  }

  Future<void> boarding() async {
    const String url = '${busBookingUrl}GetBoardingPointDetails';

    final Map<String, dynamic> requestBody = {
      "EndUserIp": "192.168.5.37",
      "ResultIndex": resultIndex,
      "TraceId": widget.trackId,
      "TokenId": busToken
    };
    print(requestBody);
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(requestBody));
    if (response.statusCode == 307) {
      final String? redirectedUrl = response.headers['location'];
      // Send another request to the redirected URL
      final redirectedResponse = await http.post(Uri.parse(redirectedUrl ?? ''),
          headers: headers, body: jsonEncode(requestBody));
      // Process the redirected response as needed

      print(redirectedResponse.body);
      var finalResult = jsonDecode(redirectedResponse.body);

      if (finalResult['GetBusRouteDetailResult']['BoardingPointsDetails'] !=
          null) {
        setState(() {
          loading = false;
          for (var v in finalResult['GetBusRouteDetailResult']
          ['BoardingPointsDetails']) {
            boardList.add(BoardingModel.fromJson(v));
          }
          for (var v in finalResult['GetBusRouteDetailResult']
          ['DroppingPointsDetails']) {
            dropList.add(BoardingModel.fromJson(v));
          }
        });
      } else {
        String msg =
        finalResult['GetBusRouteDetailResult']['Error']['ErrorMessage'];
        Fluttertoast.showToast(msg: msg);
      }
    }
    // var request = http.Request('POST', Uri.parse('http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/GetBusSeatLayOut'));
  }


  Widget FormContainer() {
    return Column(
      children: passengerList.map((e) {
        int index =
        passengerList.indexWhere((element) => element.type!.contains(e.type!));
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
                        horizontal: 13.0,
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
                        title.map<DropdownMenuItem<String>>((String value) {
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
                            passengerList[index].title = value;
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
                          passengerList[index].fName = value;
                        });
                      },
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
                      onChanged: (String value) {
                        setState(() {
                          passengerList[index].lName = value;
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey)),
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        underline: SizedBox(),
                        value: e.gender,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items:
                        gender.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Gender",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            passengerList[index].gender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          passengerList[index].age = value;
                        });
                      },
                      decoration: const InputDecoration(
                        counterText: "",
                        isDense: true,
                        labelText: "Age",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(children: [
                  TextFormField(
                    onChanged: (String value) {
                      setState(() {
                        passengerList[index].address = value;
                      });
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: "Address",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (String value) {
                      setState(() {
                        passengerList[index].email = value;
                      });
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: "email",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      setState(() {
                        passengerList[index].phone = value;
                      });
                    },
                    decoration: InputDecoration(
                      counterText: "",
                      isDense: true,
                      labelText: "Mobile",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ],),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }


  Future<void> bookBusApi() async {
    const String url = '${busBookingUrl}Book';
    var headers = {'Content-Type': 'application/json'};

    List<Map> mapList = [];



    passengerList.forEach((element) {
      bool isLead = element.phone == passengerList.first.phone ? true : false;
      int i = passengerList.indexWhere((e) => e.phone == element.phone);
      Map param = {
        "LeadPassenger": isLead,
        "PassengerId": 0,
        "Title": element.title,
        "Address": element.address,
        "Age": element.age,
        "Email": element.email,
        "FirstName": element.fName,
        "Gender": element.gender == 'Male' ? 1 : 2,
        "IdNumber": null,
        "IdType": null,
        "LastName": element.lName,
        "Phoneno": element.phone,
        "Seat": {
          "ColumnNo": widget.selectedSeat![i].columnNo,
          "Height": widget.selectedSeat![i].height,
          "IsLadiesSeat": widget.selectedSeat![i].isLadiesSeat,
          "IsMalesSeat": widget.selectedSeat![i].isMalesSeat,
          "IsUpper": widget.selectedSeat![i].isUpper,
          "RowNo": widget.selectedSeat![i].rowNo,
          "SeatIndex": widget.selectedSeat![i].seatIndex,
          "SeatName": widget.selectedSeat![i].seatName,
          "SeatStatus": widget.selectedSeat![i].seatStatus,
          "SeatType": widget.selectedSeat![i].seatType,
          "Width": widget.selectedSeat![i].width,
          "Price": {
            "CurrencyCode": "INR",
            "BasePrice": widget.selectedSeat![i].price?.basePrice,
            "Tax": widget.selectedSeat![i].price?.tax,
            "OtherCharges": widget.selectedSeat![i].price?.otherCharges,
            "Discount": widget.selectedSeat![i].price?.discount,
            "PublishedPrice": widget.selectedSeat![i].price?.publishedPrice,
            "PublishedPriceRoundedOff": widget.selectedSeat![i].price
                ?.publishedPriceRoundedOff,
            "OfferedPrice": widget.selectedSeat![i].price?.offeredPrice,
            "OfferedPriceRoundedOff": widget.selectedSeat![i].price
                ?.offeredPriceRoundedOff,
            "AgentCommission": widget.selectedSeat![i].price?.agentCommission,
            "AgentMarkUp": widget.selectedSeat![i].price?.agentMarkUp,
            "TDS": widget.selectedSeat![i].price?.tDS,
            "GST": {
              "CGSTAmount": 0.0,
              "CGSTRate": 0.0,
              "CessAmount": 0.0,
              "CessRate": 0.0,
              "IGSTAmount": 0.0,
              "IGSTRate": widget.selectedSeat![i].price?.gST?.iGSTRate,
              "SGSTAmount": 0.0,
              "SGSTRate": 0.0,
              "TaxableAmount": 0.0
            }
          }
        }
      };

      mapList.add(param);
    });






    final Map<String, dynamic> requestBody = {
      "EndUserIp": "192.168.5.37",
      "ResultIndex": widget.resultIndex,
      "TraceId": widget.trackId,
      "TokenId": busToken,
      "BoardingPointId": widget.boardingIndex,
      "DropingPointId": widget.droppingIndex,
      "Passenger": mapList
    };
    print("_______${requestBody}_______");

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(requestBody));
    if (response.statusCode == 307) {
      final String? redirectedUrl = response.headers['location'];
      final redirectedResponse = await http.post(Uri.parse(redirectedUrl ?? ''),
          headers: headers, body: jsonEncode(requestBody));
      // Process the redirected response as needed

      print(redirectedResponse.body);
      var finalResult = jsonDecode(redirectedResponse.body);

      if (finalResult['BookResult'] != null) {

        print("_______${finalResult['BookResult']['BusBookingStatus']}_______");
        setState(() {
          isLoading = false ;
        });
        String msg =
        finalResult['BookResult']['BusBookingStatus'];
        getBookingBusApi(finalResult['BookResult']['TraceId'].toString(), finalResult['BookResult']['BusId'].toString(),finalResult['BookResult']['InvoiceAmount']);

        Fluttertoast.showToast(msg: msg, backgroundColor: Colors.green,);
    

      } else {
        String msg =
        finalResult['BookResult']['Error']['ErrorMessage'];
        Fluttertoast.showToast(msg: msg);
        setState(() {
          isLoading = false ;
        });
      }
    }
    // var request = http.Request('POST', Uri.parse('http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/GetBusSeatLayOut'));
  }
  Future<void> getBookingBusApi(String traceId,String busId,double amount) async {
    const String url = '${busBookingUrl}GetBookingDetail';
    var headers = {'Content-Type': 'application/json'};








    final Map<String, dynamic> requestBody = {
      "EndUserIp": "192.168.5.37",
      "BusId": busId,
      "TraceId":traceId,
      "TokenId": busToken,
      "IsBaseCurrencyRequired": false,

    };
    print("_______${requestBody}_______");

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(requestBody));
    if (response.statusCode == 307) {
      final String? redirectedUrl = response.headers['location'];
      final redirectedResponse = await http.post(Uri.parse(redirectedUrl ?? ''),
          headers: headers, body: jsonEncode(requestBody));
      // Process the redirected response as needed

      print(redirectedResponse.body);
      var finalResult = jsonDecode(redirectedResponse.body);

      if (finalResult['GetBookingDetailResult'] != null) {

       // print("_______${finalResult['BookResult']['BusBookingStatus']}_______");
        setState(() {
          isLoading = false ;
        });


        finalBookingApi(traceId, amount,finalResult['GetBookingDetailResult']);



      } else {
        String msg =
        finalResult['BookResult']['Error']['ErrorMessage'];
        Fluttertoast.showToast(msg: msg);
        setState(() {
          isLoading = false ;
        });
      }
    }
    // var request = http.Request('POST', Uri.parse('http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/GetBusSeatLayOut'));
  }
  finalBookingApi(String id,double? amount,response1) async {
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer ${App.localStorage.getString("token")}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}booking/addToCart'));
    request.fields.addAll({
      'service_type': 'car',
      'service_id': '3',
      'booking_id': id,
      'amount': amount.toString(),
      'booking_reponse':jsonEncode(response1),
      'name': "",
      'number': passengerList.length.toString(),
      'start_date': response1['Itinerary']['DateOfJourney'],
      'end_date': response1['Itinerary']['DateOfJourney'],
    });

    debugPrint('_____request.fields__surendra___${Uri.parse('${baseUrl}booking/addToCart')}______${request}___');
    debugPrint('_____request.fields__surendra___${request.fields}______${request}___');

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult =  jsonDecode(result);
      debugPrint(result);
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
  Future<void> blockBusApi() async  {
    setState(() {
      isLoading = true ;
    });
    const String url = '${busBookingUrl}Block';
    var headers = {'Content-Type': 'application/json'};

    List<Map> mapList = [];



    passengerList.forEach((element) {
      bool isLead = element.phone == passengerList.first.phone ? true : false;
      int i = passengerList.indexWhere((e) => e.phone == element.phone);
      Map param = {
        "LeadPassenger": isLead,
        "PassengerId": 0,
        "Title": element.title,
        "Address": element.address,
        "Age": element.age,
        "Email": element.email,
        "FirstName": element.fName,
        "Gender": element.gender == 'Male' ? 1 : 2,
        "IdNumber": null,
        "IdType": null,
        "LastName": element.lName,
        "Phoneno": element.phone,
        "Seat": {
          "ColumnNo": widget.selectedSeat![i].columnNo,
          "Height": widget.selectedSeat![i].height,
          "IsLadiesSeat": widget.selectedSeat![i].isLadiesSeat,
          "IsMalesSeat": widget.selectedSeat![i].isMalesSeat,
          "IsUpper": widget.selectedSeat![i].isUpper,
          "RowNo": widget.selectedSeat![i].rowNo,
          "SeatIndex": widget.selectedSeat![i].seatIndex,
          "SeatName": widget.selectedSeat![i].seatName,
          "SeatStatus": widget.selectedSeat![i].seatStatus,
          "SeatType": widget.selectedSeat![i].seatType,
          "Width": widget.selectedSeat![i].width,
          "Price": {
            "CurrencyCode": "INR",
            "BasePrice": widget.selectedSeat![i].price?.basePrice,
            "Tax": widget.selectedSeat![i].price?.tax,
            "OtherCharges": widget.selectedSeat![i].price?.otherCharges,
            "Discount": widget.selectedSeat![i].price?.discount,
            "PublishedPrice": widget.selectedSeat![i].price?.publishedPrice,
            "PublishedPriceRoundedOff": widget.selectedSeat![i].price
                ?.publishedPriceRoundedOff,
            "OfferedPrice": widget.selectedSeat![i].price?.offeredPrice,
            "OfferedPriceRoundedOff": widget.selectedSeat![i].price
                ?.offeredPriceRoundedOff,
            "AgentCommission": widget.selectedSeat![i].price?.agentCommission,
            "AgentMarkUp": widget.selectedSeat![i].price?.agentMarkUp,
            "TDS": widget.selectedSeat![i].price?.tDS,
            "GST": {
              "CGSTAmount": 0.0,
              "CGSTRate": 0.0,
              "CessAmount": 0.0,
              "CessRate": 0.0,
              "IGSTAmount": 0.0,
              "IGSTRate": widget.selectedSeat![i].price?.gST?.iGSTRate,
              "SGSTAmount": 0.0,
              "SGSTRate": 0.0,
              "TaxableAmount": 0.0
            }
          }
        }
      };

      mapList.add(param);
    });






    final Map<String, dynamic> requestBody = {
      "EndUserIp": "192.168.5.37",
      "ResultIndex": widget.resultIndex,
      "TraceId": widget.trackId,
      "TokenId": busToken,
      "BoardingPointId": widget.boardingIndex,
      "DropingPointId": widget.droppingIndex,
      "Passenger": mapList
    };
    print("___ddddd____${requestBody}_______");

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(requestBody));
    if (response.statusCode == 307) {
      final String? redirectedUrl = response.headers['location'];
      final redirectedResponse = await http.post(Uri.parse(redirectedUrl ?? ''),
          headers: headers, body: jsonEncode(requestBody));
      // Process the redirected response as needed
      print(redirectedResponse.body);
      var finalResult = jsonDecode(redirectedResponse.body);
      if (finalResult['BlockResult']['TravelName'] !=
          null) {
        openCheckout();
        //bookBusApi();

      } else {
        String msg =
        finalResult['BlockResult']['Error']['ErrorMessage'];
      Fluttertoast.showToast(msg: msg);
        setState(() {
          isLoading = false ;
        });
      }
    }
    // var request = http.Request('POST', Uri.parse('http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/GetBusSeatLayOut'));
  }

  void openCheckout() async   {
  /*  SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userMobile = prefs.getString('mobile');
    String? userEmail = prefs.getString('email');*/

  //  double price1 = reviewModel!.fc!.tF! + serviceAmount;
    int price =totalPrice.toInt();


    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': price*100,
      'name': 'Assignment-assist',
      'description': 'Assignment-assist',
     // 'prefill': {'contact': '$userMobile', 'email': '$userEmail'},
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
    bookBusApi();
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

  void _handleExternalWallet(ExternalWalletResponse response) {
    bookBusApi();
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}

class SeatItem extends StatelessWidget {
  final String seatName;
  final bool seatStatus;
  final String seatType;

  SeatItem({
    required this.seatName,
    required this.seatStatus,
    required this.seatType,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor = Colors.green;
    if (!seatStatus) {
      seatColor = Colors.grey;
    } else if (seatType == '2') {
      seatColor = Colors.blue;
    }

    return Container(
      decoration: BoxDecoration(
        color: seatColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: Text(
          seatName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
