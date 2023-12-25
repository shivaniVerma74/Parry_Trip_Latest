import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:parry_trip2/Library/rattings.dart';
import 'package:http/http.dart'as http;
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';
import 'package:parry_trip2/model/bus_model/bus_book_model.dart';
import 'package:parry_trip2/model/fare_rule_model.dart';
import 'package:parry_trip2/model/hotel_book_model.dart';
import 'package:parry_trip2/model/tour/flight_book_model.dart';
import 'package:parry_trip2/model/tour/tour_book_model.dart';
import 'package:parry_trip2/screens/BookingScreen/bus_booking_detail.dart';
import 'package:parry_trip2/screens/BookingScreen/flight_booking_detail_.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_colors.dart';
import '../../model/All_booking_list_model.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =TabController(length: 4, vsync: this);
    getBookingList();
  }
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         centerTitle: true,
         elevation: 0.0,
         title: Padding(
           padding: const EdgeInsets.only(top: 20.0, left: 5.0),
           child: Text(
             'Booking List'.tr,
             style: const TextStyle(
                 fontFamily: "Sofia",
                 fontSize: 25.0,
                 fontWeight: FontWeight.w800,
                 color: Colors.black),
           ),
         ),
         bottom:  TabBar(
           controller: tabController,
           indicator: BoxDecoration(
               color: Colors.green[300],
               borderRadius:  BorderRadius.circular(25.0)
           ),
           onTap: (index){
             setState(() {
               tabController!.index = index;
             });
           },
           labelColor: Colors.white,
           unselectedLabelColor: Colors.black,
           tabs: const  [
             Tab(text: 'Hotel',),
             Tab(text: 'Flight',),
             Tab(text: 'Bus',),
             Tab(text: 'Tour',)
           ],
         ),
       ),
      body:!loading?Padding(
        padding: const EdgeInsets.all(8.0),
        child: tabController!.index == 0 ? hotelCard():tabController!.index == 1 ? flightCard():tabController!.index == 3 ? tourCard():busCard(),
      ):const Center(child: CircularProgressIndicator(),),


    );
  }

  listCard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  _currentIndex = 1;
                  // getNewListApi(1);

                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _currentIndex == 1 ?
                    colors.primary
                        : colors.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 45,
                child: Center(
                  child: Text("Hotal",style: TextStyle(color: _currentIndex == 1 ?colors.whiteTemp:colors.blackTemp,fontSize: 18)),
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  _currentIndex = 2;
                  // getNewListApi(3);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _currentIndex == 2 ?
                    colors.primary
                        : colors.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                // width: 120,
                height: 45,
                child: Center(
                  child: Text("Flight",style: TextStyle(color: _currentIndex == 2 ?colors.whiteTemp:colors.blackTemp,fontSize: 18),),
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  _currentIndex = 3;
                  // getNewListApi(3);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _currentIndex == 3 ?
                    colors.primary
                        : colors.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                // width: 120,
                height: 45,
                child: Center(
                  child: Text("Bus",style: TextStyle(color: _currentIndex == 3 ?colors.whiteTemp:colors.blackTemp,fontSize: 18),),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
  busCard(){
    return busList.isNotEmpty?ListView.builder(
        itemCount: busList.length,
        shrinkWrap: true,
        itemBuilder: (context,i){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BusBooking(busList[i])));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container( decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.grey.withOpacity(0.3),

                          ),
                              padding:const EdgeInsets.all(8.0),

                              child: Text("B.ID-${busList[i].bookingId}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ),
                        const SizedBox(width: 5,),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColor.activeColor,

                            ),
                            padding:const EdgeInsets.all(5.0),
                            child: Text("${busList[i].status}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 5,),
                    Text("${busList[i].bookinDeatils?.itinerary!.travelName}",style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: AppColor.activeColor),),
                    const SizedBox(height: 8,),
                    Text(
                      "${busList[i].bookinDeatils?.itinerary!.busType}(${busList[i].bookinDeatils!.itinerary!.busId}-${busList[i].bookinDeatils!.itinerary!.ticketNo})",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          busList[i].bookinDeatils!.itinerary!.origin.toString(),
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                        ),
                        Icon(Icons.arrow_forward),
                        Text(
                          busList[i].bookinDeatils!.itinerary!.destination.toString(),
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .format(DateTime.parse(busList[i].bookinDeatils!.itinerary!.departureTime.toString())),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Departure",
                                style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                "${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(busList[i].bookinDeatils!.itinerary!.departureTime!))}",
                                style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Arrival",
                                style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                "${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(busList[i].bookinDeatils!.itinerary!.arrivalTime!))}",
                                style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container( decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blue.withOpacity(0.3),

                        ),
                            padding:const EdgeInsets.all(8.0),
                            child: Text("${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(busList[i].bookinDeatils!.itinerary!.bookingHistory!.first.createdOn.toString()))}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.green,

                            ),
                            padding:const EdgeInsets.all(5.0),
                            child: Text("₹${busList[i].bookinDeatils!.itinerary!.invoiceAmount}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                downloadLoading = true;
                              });
                              downloadAndOpenFile(busList[i].code);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.all(15),
                              child:  Center(
                                child:  !downloadLoading?const Text(
                                  "Invoice",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ):const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              showCancelBottom(busList[i]);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: const Center(
                                child:  Text(
                                  "Cancel Booking",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

        }):const Center(child: Text("No Bus Booking Available"),);
  }
  flightCard(){
    return flightList.isNotEmpty?ListView.builder(
        itemCount: flightList.length,
        shrinkWrap: true,
        itemBuilder: (context,i){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightBooking(flightList[i])));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container( decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.grey.withOpacity(0.3),

                          ),
                              padding:const EdgeInsets.all(8.0),

                              child: Text("B.ID-${flightList[i].bookingId}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ),
                        const SizedBox(width: 5,),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: flightList[i].bookinDeatils?.order?.status=="PENDING"?Colors.orange:flightList[i].bookinDeatils?.order?.status=="SUCCESS"?Colors.green:Colors.red,

                            ),
                            padding:const EdgeInsets.all(5.0),
                            child: Text("${flightList[i].bookinDeatils?.order?.status}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 5,),
                    Text("${flightList[i].bookinDeatils?.itemInfos?.aIR!.tripInfos!.first.sI!.first.da!.name}",style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: AppColor.activeColor),),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(
                          "${flightList[i].bookinDeatils?.itemInfos?.aIR!.tripInfos!.first.sI![0].fD!.aI!.name.toString()}(${flightList[i].bookinDeatils?.itemInfos?.aIR!.tripInfos!.first.sI![0].fD!.aI!.code}-${flightList[i].bookinDeatils?.itemInfos?.aIR!.tripInfos!.first.sI![0].fD!.fN})",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          flightList[i].bookinDeatils!.itemInfos!.aIR!.tripInfos!.first.sI![0].da!.city.toString().toString(),
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                        ),
                        Icon(Icons.arrow_forward),
                        Text(
                          flightList[i].bookinDeatils!.itemInfos!.aIR!.tripInfos!.first.sI![0].aa!.city.toString(),
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .format(DateTime.parse(flightList[i].bookinDeatils!.itemInfos!.aIR!.tripInfos!.first.sI![0].dt.toString())),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Arrival",
                                style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                "${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(flightList[i].bookinDeatils!.itemInfos!.aIR!.tripInfos!.first.sI!.first.at!))}",
                                style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Departure",
                                style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                "${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(flightList[i].bookinDeatils!.itemInfos!.aIR!.tripInfos!.first.sI!.first.dt!))}",
                                style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container( decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blue.withOpacity(0.3),

                        ),
                            padding:const EdgeInsets.all(8.0),
                            child: Text("${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(flightList[i].bookinDeatils!.order!.createdOn.toString()))}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.green,

                            ),
                            padding:const EdgeInsets.all(5.0),
                            child: Text("₹${flightList[i].bookinDeatils?.order?.amount}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                downloadLoading = true;
                              });
                              downloadAndOpenFile(flightList[i].code);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.all(15),
                              child:  Center(
                                child:  !downloadLoading?const Text(
                                  "Invoice",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ):const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              cancelDialog(flightList[i].id.toString());
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: const Center(
                                child:  Text(
                                  "Cancel Booking",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          );

        }):const Center(child: Text("No Flight Booking Available"),);
  }
  FareRule? rules;
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
      setState(() {
        rules = FareRule.fromJson(v.values.elementAt(0)['fr']);
      });
    } else {}
  }
  hotelCard(){
    return hotelList.isNotEmpty?ListView.builder(
      shrinkWrap: true,
      itemCount: hotelList.length,
        itemBuilder: (context,i){
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container( decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey.withOpacity(0.3),

                    ),
                        padding:const EdgeInsets.all(8.0),

                        child: Text("B.ID-${hotelList[i].bookingId}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: hotelList[i].bookinDeatils?.order?.status=="PENDING"?Colors.orange:hotelList[i].bookinDeatils?.order?.status=="SUCCESS"?Colors.green:Colors.red,

                      ),
                      padding:const EdgeInsets.all(5.0),
                      child: Text("${hotelList[i].bookinDeatils?.order?.status}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                ],
              ),
              const Divider(),
              const SizedBox(height: 5,),
            Text("${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.hInfo?.name}",style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: AppColor.activeColor),),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Expanded(child: Text("${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.hInfo?.ad!.adr}")),
                  IconButton(onPressed: ()async{
                    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.hInfo?.gl!.lt},${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.hInfo?.gl!.ln}';
                    if (await canLaunch(googleUrl)) {
                    await launch(googleUrl);
                    } else {
                    throw 'Could not open the map.';
                    }
                  }, icon:const Icon(Icons.location_on_outlined)),
                ],
              ),
              const SizedBox(height: 8,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Check In",
                          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          "${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.query!.checkinDate}",
                          style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Check Out",
                          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          "${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.query!.checkoutDate}",
                          style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Text("Room Info",style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: Colors.black),),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Adults x ${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.query!.roomInfo!.first.numberOfAdults}",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                  Text("Children x ${hotelList[i].bookinDeatils?.itemInfos?.hOTEL?.query!.roomInfo!.first.numberOfChild}",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                ],
              ),
              const SizedBox(height: 8,),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container( decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.blue.withOpacity(0.3),

                  ),
                      padding:const EdgeInsets.all(8.0),
                      child: Text("${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(hotelList[i].bookinDeatils!.order!.createdOn.toString()))}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.green,

                      ),
                      padding:const EdgeInsets.all(5.0),
                      child: Text("₹${hotelList[i].bookinDeatils?.order?.amount}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          downloadLoading = true;
                        });
                        downloadAndOpenFile(hotelList[i].code);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(15),
                        child:  Center(
                          child:  !downloadLoading?const Text(
                            "Invoice",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ):const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        cancelDialog(hotelList[i].id.toString());
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: const Center(
                          child:  Text(
                            "Cancel Booking",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            ),
        ),
         );
        }
        ):const Center(child: Text("No Hotel Booking Available"),);
  }


  tourCard(){
    return tourList.isNotEmpty?ListView.builder(
        shrinkWrap: true,
        itemCount: tourList.length,
        itemBuilder: (context,i){
          return tourList[i].service!=null?Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container( decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey.withOpacity(0.3),

                        ),
                            padding:const EdgeInsets.all(8.0),

                            child: Text("B.ID-${tourList[i].id}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                      ),
                      const SizedBox(width: 5,),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColor.activeColor,

                          ),
                          padding:const EdgeInsets.all(5.0),
                          child: Text("${tourList[i].status}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 5,),
                  Text("${tourList[i].service!.title}",style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: AppColor.activeColor),),
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      Expanded(child: Text(tourList[i].service!.address ?? "")),
                      IconButton(onPressed: ()async{
                        String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${tourList[i].service!.mapLat},${tourList[i].service!.mapLng}';
                        if (await canLaunch(googleUrl)) {
                          await launch(googleUrl);
                        } else {
                          throw 'Could not open the map.';
                        }
                      }, icon:const Icon(Icons.location_on_outlined)),
                    ],
                  ),
                  const SizedBox(height: 8,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Check In",
                              style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              "${tourList[i].startDate}",
                              style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Duration",
                              style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              "${getDays(tourList[i].service!.duration)}",
                              style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Guest",
                              style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              "${tourList[i].totalGuests}",
                              style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Payment Method",
                              style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black87),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              "${tourList[i].gateway} ",
                              style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  ExpansionTile(
                    tilePadding:const EdgeInsets.symmetric(vertical: 10),
                    expandedCrossAxisAlignment :CrossAxisAlignment.start,
                    title: Text("Customer Info",style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: Colors.black),),
                    children: [
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Full Name",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                          Text("${tourList[i].firstName} ${tourList[i].lastName}",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mobile No.",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                          Text(tourList[i].phone ?? "",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                          Text(tourList[i].email ?? "",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                        ],
                      ),

                      const SizedBox(height: 8,),
                      Text("Address",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                      const SizedBox(height: 5,),
                      Text("${tourList[i].address ?? ""} ${tourList[i].address2?? ""},${tourList[i].city} ${tourList[i].zipCode},${tourList[i].state ?? ""},${tourList[i].country ?? ''}",style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black),),
                      const SizedBox(height: 8,),
                      Text("Special Requirement",style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.black),),
                      const SizedBox(height: 5,),
                      Text("${tourList[i].customerNotes}",style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(color: Colors.black),),
                      const SizedBox(height: 8,),
                    ],
                  ),

                  const SizedBox(height: 8,),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.green,

                          ),
                          padding:const EdgeInsets.all(5.0),
                          child: Text("Deposit Amount ₹${tourList[i].payNow}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),

                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.red,

                          ),
                          padding:const EdgeInsets.all(5.0),
                          child: Text("Left Amount ₹${tourList[i].deposit}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container( decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blue.withOpacity(0.3),

                      ),
                          padding:const EdgeInsets.all(8.0),
                          child: Text("${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.parse(tourList[i].createdAt!))}",style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.green,

                          ),
                          padding:const EdgeInsets.all(5.0),
                          child: Text("₹${tourList[i].total}",style: Theme.of(context).primaryTextTheme.bodyLarge,)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              downloadLoading = true;
                            });
                            print('${tourList[i].code}_______________');
                            downloadAndOpenFile(tourList[i].code);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.all(15),
                            child:  Center(
                              child:  !downloadLoading?const Text(
                                "Invoice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ):const CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                              cancelDialog(tourList[i].id.toString());
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: const Center(
                              child:  Text(
                                "Cancel Booking",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ):const SizedBox();
        }
    ):const Center(child: Text("No Tour Booking Available"),);
  }
  final String fileUrl =
      'https://example.com/yourfile.pdf'; // Replace with your file URL
  bool downloadLoading = false;

  Future<void> downloadAndOpenFile(code) async {


    final Directory? tempDir = await getExternalStorageDirectory();
    String fileName = '$code.pdf'; // Replace with your desired file name
    String filePath = '${tempDir!.path}/$fileName';
    print(filePath);

    File file  = File(filePath);
    if(false/*file.existsSync()*/){
      setState(() {
        downloadLoading = false;
      });
      OpenFile.open(filePath);
    }else{
    var headers = {
      'Authorization': 'Bearer ${App.localStorage.getString("token")}'
    };
    final response = await http.get(Uri.parse("${baseUrl}booking/$code/invoice"),headers: headers);
    print(Uri.parse("${baseUrl}booking/$code/invoice"));
    print(response.statusCode);
    //print(response.body);
    Map data = jsonDecode(response.body);
    String? fileUrl = data['invoice_url'];

    print("========get api ${fileUrl}");
    if(fileUrl==""||fileUrl==null){
      fileUrl = "https://www.africau.edu/images/default/sample.pdf";
    }
    if(fileUrl!=""){
     print("==not null imageurl=====${fileUrl}");
    final response = await http.get(Uri.parse(fileUrl));
    print(response.statusCode);
    //print(response.body);
    if (response.statusCode == 200) {
      // Save the file locally
      final Uint8List bytes = response.bodyBytes;
      print(filePath);

      File file  = await File(filePath).writeAsBytes(bytes);
      if(file.existsSync()){
        setState(() {
          downloadLoading = false;
        });
      }
      // Open the file
      OpenFile.open(filePath).then((value) {

      }).onError((error, stackTrace){
        print(error);
      });
    } else {
      setState(() {
        downloadLoading = false;
      });
      Common().toast("Failed to download file");
      throw Exception('Failed to download file');
    }}else{

      print("==null imageurl=====${fileUrl}");

      setState(() {
        downloadLoading = false;
      });
      Common().toast("Failed to download file");
    }}
  }
  getDays(int? duration){
    if(duration!=null){
      int days = duration ~/ 24;
      int hour = duration % 24;
      return "${days}d ${hour}h";
    }
    return "Not Available";
  }

  showCancelBottom(BusBookModel model){
    showModalBottomSheet(context: context, builder: (context)=>Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         const Text(
            "Cancel Booking Details",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 14.0),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: model.bookinDeatils!.itinerary!.cancelPolicy!.map((e) {
              int index = model.bookinDeatils!.itinerary!.cancelPolicy!.indexWhere((element) => element.cancellationCharge==e.cancellationCharge);

              return ListTile(
                leading: Text(
                  "₹${e.cancellationCharge}",
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
                  "${e.fromDate}-${e.toDate}",
                  style:const  TextStyle(
                    fontFamily: 'open-sans',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                subtitle: Text(
                  "${e.policyString}",
                  style:const  TextStyle(
                    fontFamily: 'open-sans',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,

                  ),
                ),
                trailing: Text(
                  "₹${e.cancellationCharge}",
                  style: const TextStyle(
                    fontFamily: 'open-sans',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,

                  ),
                ),
              );}).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Center(
                    child:  Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
              const SizedBox(width: 10,),
              Expanded(child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  cancelDialog(model.id.toString());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Center(
                    child:  Text(
                      "Continue",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),

        ],
      ),
    ));
  }
  cancelDialog(String id){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Cancel Booking"),
        content: const Text("do you want to proceed?"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child:const Text("No")),
          TextButton(onPressed: (){
            Navigator.pop(context);
            cancelBooking(id);
          }, child:const Text("Yes")),
        ],
      );
    });
  }
  //AllBookingListModel? allBookingListModel;
  List<HotelBookModel> hotelList = [];
  List<TourBookModel> tourList = [];
  List<FlightBookModel> flightList = [];
  List<BusBookModel> busList = [];
  bool loading = false;
  cancelBooking(String id)async{
    setState(() {
      loading = true;
    });
    var headers = {
      'Authorization': 'Bearer ${App.localStorage.getString("token")}'
    };
    debugPrint("${baseUrl}user/cancel-booking/$id");
    var response = await http.get(Uri.parse("${baseUrl}user/cancel-booking/$id"),headers: headers);
    debugPrint(response.body);
    Map data = jsonDecode(response.body);
    if(data['status']){
      Fluttertoast.showToast(msg: data['message'].toString());
    }
    getBookingList();
  }
  getBookingList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    print("getEventUserId--------------->${userId}");
    setState(() {
      loading = true;
    });
    var headers = {
      'Authorization': 'Bearer ${App.localStorage.getString("token")}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}booking/get-bookings'));
    request.fields.addAll({
      'user_id': '${App.localStorage.getString("userId")}'
    });
    //print('__________${}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    setState(() {
      loading = false;
      hotelList.clear();
      tourList.clear();
      busList.clear();
      flightList.clear();
    });
    if (response.statusCode == 200) {
      var result =  await response.stream.bytesToString();
      Map data = json.decode(result);
      setState(() {
        if(data['bookings']!=null){
          print('______ssss____${result}_________');
          if(data['bookings']['hotel']!=null){
            for(var v in data['bookings']['hotel']){
              hotelList.add(HotelBookModel.fromJson(v));
            }
          }
          if(data['bookings']['tour']!=null){
            for(var v in data['bookings']['tour']){
              tourList.add(TourBookModel.fromJson(v));
            }
          }
          if(data['bookings']['car']!=null){
            for(var v in data['bookings']['car']){
              busList.add(BusBookModel.fromJson(v));
            }
          }
          if(data['bookings']['flight']!=null){
            for(var v in data['bookings']['flight']){
              flightList.add(FlightBookModel.fromJson(v));
            }
          }

        }else{
          Common().toast("No Booking Available");
        }
      });
      
     }
    else {
      print(response.reasonPhrase);
    }

  }
}


class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colors.primary // Color of the line
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0; // Width of the line

    double dashWidth = 0; // Width of each dash
    double dashSpace = 5; // Space between each dash

    double startY = 0; // Starting point for the line
    double endY = size.height; // Ending point for the line

    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        paint,
      );

      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class DottedLinePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colors.secondary // Color of the line
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0; // Width of the line

    double dashWidth = 0; // Width of each dash
    double dashSpace = 5; // Space between each dash

    double startY = 0; // Starting point for the line
    double endY = size.height; // Ending point for the line

    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        paint,
      );

      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class dataFirestore extends StatelessWidget {
  final String? userId;
  dataFirestore({this.list, this.userId});
  final List? list;
  var _txtStyleTitle = TextStyle(
    color: Colors.black87,
    fontFamily: "Gotik",
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
  );

  var _txtStyleSub = TextStyle(
    color: Colors.black26,
    fontFamily: "Gotik",
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
          ],
        ),
      ),
    );

    return SizedBox.fromSize(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: 10,
          itemBuilder: (context, i) {
            //List<String> photo = List.from(list[i].data()['photo']);
           // List<String> service = List.from(list[i].data()['service']);
           // List<String> description = List.from(list[i].data()['description']);
            String title = 'title';
            //String type = 'type';
            double rating = 4.5;
            String image = 'https://www.seleqtionshotels.com/content/dam/seleqtions/Connaugth/TCPD_PremiumBedroom4_1235.jpg/jcr:content/renditions/cq5dam.web.1280.1280.jpeg';
            String id = 'id';
            String checkIn = 'Check In';
            String checkOut = 'Check Out';
            String count = 'Count';
            String locationReservision = 'Location';
            String rooms = 'Rooms';
            String roomName = 'Room Name';
            String information = 'Information Room';

            num priceRoom = 250;
            num price = 150;
           // num latLang1 = list[i].data()['latLang1'];
            //num latLang2 = list[i].data()['latLang2'];

            //DocumentSnapshot _list = list[i];

            return InkWell(
              onTap: () {
                /*Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new BookingDetail(
                      userId: userId,
                      titleD: title,
                      idD: id,
                      imageD: image,
                      information: information,
                      priceRoom: priceRoom,
                      roomName: roomName,
                      latLang1D: latLang1,
                      latLang2D: latLang2,
                      priceD: price,
                      listItem: _list,
                      descriptionD: description,
                      photoD: photo,
                      ratingD: rating,
                      serviceD: service,
                      typeD: type,
                      checkIn: checkIn,
                      checkOut: checkOut,
                      count: count,
                      locationReservision: locationReservision,
                      rooms: rooms,
                    ),
                    transitionDuration: Duration(milliseconds: 1000),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    }));*/
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Container(
                  height: 280.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 3.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Column(children: [
                    Container(
                      height: 165.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover),
                      ),
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                        child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.black54,
                            child: InkWell(
                              onTap: () {
                                /*showDialog(
                                    context: context,
                                    builder: (_) => NetworkGiffyDialog(
                                      image: Image.network(
                                        image,
                                        fit: BoxFit.cover,
                                      ),
                                      title: Text(
                                          'CANCEL_BOOKING'.tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Gotik",
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600)),
                                      description: Text(
                                       'ARE_YOU_WANT'.tr +
                                            title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Popins",
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black26),
                                      ),
                                      onOkButtonPressed: () {
                                        Navigator.pop(context);

                                        FirebaseFirestore.instance
                                            .runTransaction(
                                                (transaction) async {
                                              DocumentSnapshot snapshot =
                                              await transaction
                                                  .get(list[i].reference);
                                              await transaction
                                                  .delete(snapshot.reference);
                                              SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                              prefs.remove(title);
                                            });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              AppLocalizations.of(context)
                                                  .tr('cancelBooking2') +
                                                  title),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 3),
                                        ));
                                      },
                                    ));*/

                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: 220.0,
                                    child: Text(
                                      title,
                                      style: _txtStyleTitle,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Row(
                                  children: <Widget>[
                                    ratingbar(
                                      starRating: rating,
                                      color: Color(0xFF09314F),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Text(
                                      "(" + rating.toString() + ")",
                                      style: _txtStyleSub,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.9),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 16.0,
                                        color: Colors.black26,
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 3.0)),
                                      Text(locationReservision, style: _txtStyleSub)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 13.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "\$" + price.toString(),
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color(0xFF09314F),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Gotik"),
                                ),
                                Text('PER_NIGHT'.tr,
                                    style: _txtStyleSub.copyWith(fontSize: 11.0))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.9),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  'CHECK_IN'.tr +
                                      " : \t",
                                  style: _txtStyleSub.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Padding(padding: EdgeInsets.only(top: 3.0)),
                              Text(checkIn, style: _txtStyleSub)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.9),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  'CHECK_OUT'.tr +
                                      " : \t",
                                  style: _txtStyleSub.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Padding(padding: EdgeInsets.only(top: 3.0)),
                              Text(checkOut, style: _txtStyleSub)
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            );
          },
        ));
  }
}
