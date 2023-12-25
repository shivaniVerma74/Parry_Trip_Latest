import 'package:flutter/material.dart';
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
import 'package:parry_trip2/model/seat_model.dart';
import 'package:parry_trip2/screens/FLight/FlightList.dart';
import 'package:parry_trip2/screens/HomeScreen/home_screen.dart';
import 'package:parry_trip2/screens/bottomNavBar/bottom_Nav_bar.dart';
import 'package:parry_trip2/widgets/AppBtn.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeatInfoScreen extends StatefulWidget {
  ReviewModel model;
  List<PassengerModel> passenger;

  SeatInfoScreen(this.model, this.passenger);

  @override
  State<SeatInfoScreen> createState() => _SeatInfoScreenState();
}

class _SeatInfoScreenState extends State<SeatInfoScreen> {
  SeatInfoModel1? seatModel;
  List<PassengerModel> passenger = [];
  bool loading = false;
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passenger = widget.passenger.toList();
    passenger[selectedIndex].selected = true;
    getSeat();
  }

  void getSeat() async {
    setState(() {
      loading = true;
    });

    var headers = {'Content-Type': 'application/json', 'apikey': apiKey};
    var body = {
      "bookingId": widget.model.bookingId,
    };
    print("${flightUrl}fms/v1/seat");
    print(headers);
    print(body);
    var response = await http.post(Uri.parse('${flightUrl}fms/v1/seat'),
        body: jsonEncode(body), headers: headers);
    print(response.body);
    Map data = jsonDecode(response.body);
    setState(() {
      loading = false;
      seatModel = null;
    });
    if (data['status']['httpStatus'] == 200) {
      Map<String, dynamic> v = data as Map<String, dynamic>;
      setState(() {
        seatModel = SeatInfoModel1.fromJson(
            data['tripSeatMap']['tripSeat'][widget.model.sI!.first.id]);
      });
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: data['errors'][0]['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: Text(
          "Select Seat",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: !loading
          ? seatModel != null
              ? Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        "${widget.model.sI![0].fD!.aI!.name.toString()}(${widget.model.sI![0].fD!.aI!.code}-${widget.model.sI![0].fD!.fN})",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: seatModel!.sData!.row!,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, rowIndex) {
                              var selectIndex1 = seatModel!.sInfo!.indexWhere(
                                  (element) =>
                                      element.seatPosition!.row ==
                                      rowIndex + 1);
                              return selectIndex1 != -1
                                  ? SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      primary: true,
                                      physics: const ClampingScrollPhysics(),
                                      child: Container(
                                        height: 60,
                                        child: Row(
                                          children: List.generate(
                                              seatModel!.sData!.column!,
                                              (colIndex) {
                                            var selectIndex = seatModel!.sInfo!
                                                .indexWhere((element) =>
                                                    element.seatPosition!
                                                            .column ==
                                                        colIndex + 1 &&
                                                    element.seatPosition!.row ==
                                                        rowIndex + 1);
                                            return selectIndex != -1
                                                ? InkWell(
                                                    onTap: () {
                                                      if (!seatModel!
                                                          .sInfo![selectIndex]
                                                          .isBooked!&&!checkSelected(seatModel!
                                                          .sInfo![
                                                      selectIndex].code)) {
                                                        print(seatModel!
                                                            .sInfo![
                                                        selectIndex]
                                                            .code);
                                                        setState(() {
                                                          widget
                                                                  .passenger[
                                                                      selectedIndex]
                                                                  .key =
                                                              seatModel!
                                                                  .sInfo![
                                                                      selectIndex]
                                                                  .key1;
                                                          widget
                                                                  .passenger[
                                                                      selectedIndex]
                                                                  .code =
                                                              seatModel!
                                                                  .sInfo![
                                                                      selectIndex]
                                                                  .code;
                                                          widget
                                                                  .passenger[
                                                                      selectedIndex]
                                                                  .amount =
                                                              seatModel!
                                                                  .sInfo![
                                                                      selectIndex]
                                                                  .amount;
                                                          getTotal();
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      decoration: BoxDecoration(
                                                        color: seatModel!
                                                                .sInfo![
                                                                    selectIndex]
                                                                .isBooked!
                                                            ? Colors.grey
                                                            :checkSelected(seatModel!
                                                            .sInfo![
                                                        selectIndex].code)?Colors.green: Colors.pink.withOpacity(0.3),
                                                      ),
                                                      height: 40,
                                                      width: 40,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: seatModel!
                                                              .sInfo![
                                                                  selectIndex]
                                                              .isBooked!
                                                          ? Center(
                                                              child: Icon(
                                                                  Icons.close),
                                                            )
                                                          : Center(
                                                              child: Text(
                                                                seatModel!
                                                                    .sInfo![
                                                                        selectIndex]
                                                                    .seatNo!,
                                                              ),
                                                            ),
                                                    ),
                                                  )
                                                : Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.transparent,
                                                    ),
                                                    height: 50,
                                                    width: 50,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                  );
                                          }),
                                        ),
                                      ))
                                  : const SizedBox();
                            }),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text("No Data Found"),
                )
          : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                itemCount: passenger.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var passenger1 = passenger![index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: selectedIndex == index
                                  ? AppColor.activeColor
                                  : Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${passenger1.type}",
                            style: Theme.of(context).textTheme.titleLarge!,
                          ),
                          Text(
                            passenger![index].code != null ? "${ passenger![index].code}" : "",
                            style: Theme.of(context).textTheme.titleLarge!,
                          ),
                          Text(
                            passenger![index].code != null
                                ? "${ passenger![index].amount}"
                                : "Seat Not Selected",
                            style: Theme.of(context).textTheme.titleLarge!,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
                    "₹${total}",
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
            Center(
              child: Btn1(
                  height: 50,
                  width: 320,
                  title: 'Continue',
                  loading: loading,
                  onPress: () {
                      Navigator.pop(context,{"passenger":passenger.toList(),"total":total.toString()});
                  }),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  checkSelected(code){
    bool check =false;
    for(int i=0;i<passenger.length;i++){
        if(widget
            .passenger[
        i]
            .code!=null&&widget
            .passenger[
        i]
            .code==code){
          check = true;
          break;
        }
    }
    return check;
  }
  double total = 0;
  getTotal(){
    total = 0;

    for(int i=0;i<passenger.length;i++){
      if(widget
          .passenger[
      i]
          .code!=null){
        total +=double.parse(passenger[i].amount!);

      }
    }

  }
}
