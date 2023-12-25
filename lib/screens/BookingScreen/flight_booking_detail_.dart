import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/model/tour/flight_book_model.dart';
import 'package:parry_trip2/screens/FLight/FlightList.dart';

class FlightBooking extends StatefulWidget {
  FlightBookModel model;


  FlightBooking(this.model);

  @override
  State<FlightBooking> createState() => _FlightBookingState();
}


class _FlightBookingState extends State<FlightBooking> {
  FlightBookModel? model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.model;
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
          "Booking Detail",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),

      ),
      body:  SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: List.generate(model!.bookinDeatils!.itemInfos!.aIR!.tripInfos!.length, (index)  {
                var item = model!.bookinDeatils!.itemInfos!.aIR!.tripInfos![index];
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
                  itemCount: model!.bookinDeatils!.itemInfos!.aIR!.travellerInfos!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var passenger = model!.bookinDeatils!.itemInfos!.aIR!.travellerInfos![index];
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
                          "${passenger.ti} ${passenger.fN} ${passenger.lN}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!,
                        ),
                        subtitle: Text(
                          "${passenger.pnrDetails!.entries.first.key},${passenger.pnrDetails!.entries.first.value}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!,
                        ),
                        trailing: Text(
                          "${passenger.dob}",
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
                "Email : ${model!.bookinDeatils!.order!.deliveryInfo!.emails}",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Mobile : ${model!.bookinDeatils!.order!.deliveryInfo!.contacts}",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

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
                    "₹${model!.bookinDeatils!.itemInfos!.aIR!.totalPriceInfo!.totalFareDetail!.fC!.bF}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ],
            ),
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
                    "₹${model!.bookinDeatils!.itemInfos!.aIR!.totalPriceInfo!.totalFareDetail!.fC!.tAF}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ],
            ),

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
                    "₹${model!.bookinDeatils!.itemInfos!.aIR!.totalPriceInfo!.totalFareDetail!.fC!.tF!}",
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
          ],
        ),
      ),
    );
  }
}
