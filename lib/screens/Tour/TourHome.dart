import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/screens/Bus/search_city.dart';
import 'package:parry_trip2/screens/Tour/tour_data_list_view.dart';
import 'package:parry_trip2/screens/Tour/tour_search_city.dart';
import 'package:parry_trip2/widgets/AppBtn.dart';

class TourHomeScreen extends StatefulWidget {
  const TourHomeScreen({Key? key}) : super(key: key);

  @override
  State<TourHomeScreen> createState() => _TourHomeScreenState();
}

class _TourHomeScreenState extends State<TourHomeScreen> {

  final fromController = TextEditingController();

  String? startDate ;
  String? endDate ;
  String? selectedLocationId;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.3,
              width: MediaQuery.of(context).size.width / 1,
              child: Stack(
                children: [
                  Positioned(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/busWall.png'),
                                fit: BoxFit.contain)),
                      )),
                  /* Positioned(
                              height: MediaQuery.of(context).size.height / 5.0,
                              width: MediaQuery.of(context).size.width / 1,
                              child: Image.asset(
                                "assets/images/airplane.png",
                                height: 50,
                                width: 50,
                              )),*/
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Card(
              elevation: 10,
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: colors.black54.withOpacity(0.4)),),
                      TextFormField(
                        readOnly: true,
                        controller: fromController,
                        onTap: () {
                          Get.to(const SearchTourPlaceScreen(
                          ))?.then((value) {
                            if (value != null) {

                              fromController.text = value[0].title;
                              // originId = value[0].cityId.toString() ;
                              selectedLocationId = value[0].id.toString() ;
                              setState(() {});
                            }
                          });
                          /*var result = ShowListForm();
                    if (result != "" ||
                        result != null) {
                      fromcitycontroller =
                          TextEditingController(
                              text: result
                                  .toString());*/
                          //}
                        },
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on_outlined),
                            hintText: 'Where are you going ?',
                            hintStyle: TextStyle(
                                color: colors.black54.withOpacity(0.4))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("Select Date",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: colors.black54.withOpacity(0.4))),
                      const SizedBox(height: 10,),
                      DateTimeFormField(
                        decoration: const InputDecoration(
                          hintText: 'Select Date',
                          //enabledBorder: InputBorder.none,

                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          // labelText: 'Only time',
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        initialDate: DateTime.now().add(const Duration(days: 1)),
                        firstDate: DateTime.now().add(const Duration(days: 1)),
                        lastDate: DateTime(2030),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (e) {
                          var date = e?.add(const Duration(hours: 23));
                          return (date ?? DateTime.now())
                              .isBefore(DateTime.now())
                              ? 'Please select date after yesterday'
                              : null;
                        },
                        onDateSelected: (DateTime value) {
                          print(value);

                          startDate = DateFormat('yyyy-MM-dd').format(value);
                        },
                      ),
                      /*Row(children: [

                        const SizedBox(width: 5,),
                        Expanded(
                          child: DateTimeFormField(
                            decoration: const InputDecoration(
                              hintText: 'To',
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note),
                              // labelText: 'Only time',
                            ),
                            mode: DateTimeFieldPickerMode.date,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (e) {
                              var date = e?.add(Duration(hours: 23));
                              return (date ?? DateTime.now())
                                  .isBefore(DateTime.now())
                                  ? 'Please select date after yesterday'
                                  : null;
                            },
                            onDateSelected: (DateTime value) {
                              print(value);

                              endDate = DateFormat('yyyy-MM-dd').format(value);
                            },
                          ),
                        ),
                      ],),*/
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BtnSearch1(
                      height: 50,
                      width: 320,
                      title: 'Search',
                      onPress: () {
                        //&& endDate!=null
                        if(startDate!=null&&selectedLocationId!=null ){
                          Get.to(TourDataListScreen(locationId: selectedLocationId,
                          ));
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Please select location and  date')));
                        }


                      }
                    //getFlightSearch();
                    // if (_flightKey.currentState!.validate()) {
                    //
                    // } else {
                    //   const snackBar = SnackBar(
                    //     content: Text('All Fields are required!'),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //
                    //
                    //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    // }
                  ),
                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
