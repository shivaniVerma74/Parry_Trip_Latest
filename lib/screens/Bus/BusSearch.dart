import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parry_trip2/constants/ApiBaseHelper.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/model/bus_model/bus_search_list_response.dart';
import 'package:parry_trip2/screens/Bus/SeatSelection.dart';
import 'package:parry_trip2/screens/FLight/FlightList.dart';

class BusSearchScreen extends StatefulWidget {
  String? dateTime;
  String? fromCity;
  String? toCity;

  BusSearchScreen({this.dateTime, this.fromCity, this.toCity});

  @override
  State<BusSearchScreen> createState() => _BusSearchScreenState();
}

class _BusSearchScreenState extends State<BusSearchScreen> {
  BusSearchListResponse? busSearchListResponse;
  bool isLoading = false;

  List<FlightFilter> flightFilter = [
    FlightFilter(filterName: 'Low to High', isSelected: false),
    FlightFilter(filterName: 'High to Low', isSelected: false),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getBusSearchList ();
    busSearchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Buses"),
        backgroundColor: colors.activeColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              filterDialog();
            },
            icon: const Icon(Icons.filter_alt_rounded),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : busSearchListResponse?.busSearchResult?.busResults?.isEmpty ?? true ? Center(child: Text('Bus not available'),) : ListView.separated(
              shrinkWrap: true,
              itemCount:
                  busSearchListResponse?.busSearchResult?.busResults?.length ??
                      0,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black,
              ),
              itemBuilder: (context, index) {
                var item =
                    busSearchListResponse?.busSearchResult?.busResults?[index];
                return InkWell(
                  onTap: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BoardingDroppingScreen(
                                  boardingList: item?.boardingPointsDetails,
                                  droppingList: item?.droppingPointsDetails,
                                )));*/
                    trackId = busSearchListResponse?.busSearchResult?.traceId
                            .toString() ??
                        '';
                    print(
                        "traceId${busSearchListResponse?.busSearchResult?.traceId.toString()}");
                    print("traceId${item?.resultIndex.toString()}");
                    resultIndex = item?.resultIndex.toString() ?? '';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeatSelectionScreen(
                            trackId: busSearchListResponse
                                    ?.busSearchResult?.traceId
                                    .toString() ??
                                '',
                            resultIndex: item?.resultIndex.toString() ?? '',
                            busResult: item,
                            from:
                                busSearchListResponse!.busSearchResult!.origin,
                            to: busSearchListResponse!
                                .busSearchResult!.destination,
                          ),
                        ));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "START FORM",
                            style: TextStyle(color: colors.primary),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${item?.departureTime.toString().substring(11, 16)} - ${item?.arrivalTime.toString().substring(11, 16)}"),
                              Text(
                                "₹ ${item?.busPrice?.basePrice}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              /*Text("5h 02"),*/ Text(
                                  "${item?.availableSeats} seats left")
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.bus_alert),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${item?.travelName}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text("${item?.busType.toString().toUpperCase()}")
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  filterDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text('Sort By'),
                actions: [
                  Column(
                    children: flightFilter.map((e) {
                      return Row(
                        children: [
                          Checkbox(
                            activeColor: colors.activeColor,
                              value: e.isSelected,
                              onChanged: (value) {
                                flightFilter.forEach((element) {
                                  element.isSelected = false;
                                });
                                setState(() {
                                  e.isSelected = value;

                                });
                              }),
                          Text(e.filterName ?? ''),
                        ],
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        busSearchApi();
                        Navigator.pop(context);

                        },

                      style: ElevatedButton.styleFrom(
                          backgroundColor: colors.activeColor),
                      child: const Text('Submit'))
                ],
              );
            }
          );
        });
  }

/*
 Future <void> getBusSearchList () async{
   setState(() {
     isLoading = true ;
   });
   var headers = {
     'Content-Type': 'application/json'
   };
   var request = http.Request('POST', Uri.parse('http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/Search'));
   request.body = json.encode({
     "DateOfJourney": "2023-05-30",
     "DestinationId": "8463",
     "EndUserIp": "192.168.10.10",
     "OriginId": "9573",
     "TokenId": "1093e78f-85d7-4319-a25b-cc539f3b630c",
     "PreferredCurrency": "INR"
   });
   request.headers.addAll(headers);



   http.StreamedResponse response = await request.send();

   print('${request.body}');
   print('${response.statusCode}________');
   print('${response.request}________');
   print('${response.headers}________');

   if()

   if (response.statusCode == 200) {
    var result = await response.stream.bytesToString();
    print("_______${result}_______");
    var finalResult = BusSearchListResponse.fromJson(jsonDecode(result));


    busSearchListResponse = finalResult ;
    setState(() {
      isLoading = false ;
    });
   }
   else {
     print(response.reasonPhrase);
   }

 }*/
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  void busSearchApi() async {
    print('___________${widget.toCity}__________');
    print('___________${widget.fromCity}__________');
    bool? isHighToLow;
    bool? isLowToHigh;
    setState(() {
      isLoading = true;
    });

    const String url = 'http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/Search';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map<String, dynamic> requestBody = {
      "DateOfJourney": widget.dateTime,
      "DestinationId": widget.toCity ?? "8463",
      "EndUserIp": "192.168.10.10",
      "OriginId": widget.fromCity ?? "9573",
      "TokenId": busToken,
      "PreferredCurrency": "INR"
    };

    print('____surendra_______${requestBody}__________');
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(requestBody));

    if (response.statusCode == 307) {
      final String? redirectedUrl = response.headers['location'];
      // Send another request to the redirected URL
      final redirectedResponse = await http.post(Uri.parse(redirectedUrl ?? ''),
          headers: headers, body: jsonEncode(requestBody));
      // Process the redirected response as needed
      print(redirectedResponse.body);
      var result = jsonDecode(redirectedResponse.body);
      print('___________${result['BusSearchResult']['ResponseStatus']}__________');
      if(result['BusSearchResult']['ResponseStatus']== '1') {
        var finalResult = BusSearchListResponse.fromJson(jsonDecode(redirectedResponse.body));
        print('____surendra_______${result}_________');

        busSearchListResponse = finalResult;
        for (int i = 0; i < flightFilter.length; i++) {
          if (i == 0) {
            if (flightFilter[i].isSelected ?? false) {
              isLowToHigh = true;
            }
          } else {
            if (flightFilter[i].isSelected ?? false) {
              isHighToLow = true;
            }
          }
        }

        if (isLowToHigh ?? false) {
          busSearchListResponse?.busSearchResult?.busResults?.sort((a, b) =>
              (a.busPrice!.basePrice)!.compareTo(b.busPrice!.basePrice!));
        }
        if (isHighToLow ?? false) {
          busSearchListResponse?.busSearchResult?.busResults?.sort((a, b) =>
              (b.busPrice!.basePrice)!.compareTo(a.busPrice!.basePrice!));
        }

        setState(() {
          isLoading = false;
        });
      }else{
        var finalResult =
        BusSearchListResponse.fromJson(jsonDecode(redirectedResponse.body));
        busSearchListResponse = finalResult ;
        setState(() {
          isLoading = false;
        });
      }
    } else {
      // Handle other response codes
      print('Request failed with status code ${response.statusCode}');
    }
  }
}
