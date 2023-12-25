import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/model/bus_model/bus_book_model.dart';
import 'package:parry_trip2/model/tour/flight_book_model.dart';
import 'package:parry_trip2/screens/FLight/FlightList.dart';

class BusBooking extends StatefulWidget {
  BusBookModel model;


  BusBooking(this.model);

  @override
  State<BusBooking> createState() => _BusBookingState();
}


class _BusBookingState extends State<BusBooking> {
  BusBookModel? model;
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
          Column(children: [
            Text(
              "${model!.bookinDeatils!.itinerary!.travelName.toString()}(${model!.bookinDeatils!.itinerary!.busId}-${model!.bookinDeatils!.itinerary!.busType})",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
       const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model!.bookinDeatils!.itinerary!.origin.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
            Icon(Icons.arrow_forward),
            Text(
              model!.bookinDeatils!.itinerary!.destination.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              DateFormat.yMMMEd().format(DateTime.parse(
                  model!.bookinDeatils!.itinerary!.departureTime.toString())),
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
            model!.bookinDeatils!.itinerary!.boardingPointdetails!=null?Expanded(
              child: Column(
                children: [
                  Text(
                    getDateFormat(
                        model!.bookinDeatils!.itinerary!.departureTime.toString()),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0),
                  ),
                  Text(
                    "${model!.bookinDeatils!.itinerary!.boardingPointdetails!.cityPointName.toString()},${model!.bookinDeatils!.itinerary!.boardingPointdetails!.cityPointLocation.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        fontSize: 12.0),
                  ),
                  Text(
                    model!.bookinDeatils!.itinerary!.boardingPointdetails!.cityPointAddress.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        fontSize: 12.0),
                  ),
                ],
              ),
            ):SizedBox(),
            Column(
              children: [
                Icon(Icons.arrow_forward),
                SizedBox(
                  height: 5,
                ),
                /*Text(
                  durationToString(int.parse(
                      item!.sI![0].duration.toString())),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0),
                ),*/
              ],
            ),
            model!.bookinDeatils!.itinerary!.dropingPointdetails!=null?Expanded(
              child: Column(
                children: [
                  Text(
                    getDateFormat(
                        model!.bookinDeatils!.itinerary!.arrivalTime.toString()),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0),
                  ),
                  Text(
                    "${model!.bookinDeatils!.itinerary!.dropingPointdetails!.cityPointName.toString()},${model!.bookinDeatils!.itinerary!.dropingPointdetails!.cityPointLocation.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        fontSize: 12.0),
                  ),
                  Text(
                    model!.bookinDeatils!.itinerary!.dropingPointdetails!.cityPointAddress.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        fontSize: 12.0),
                  ),
                ],
              ),
            ):SizedBox(),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ],),
              Text(
                "Passenger Details",
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  itemCount: model!.bookinDeatils!.itinerary!.passenger!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var passenger = model!.bookinDeatils!.itinerary!.passenger![index];
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
                          "${passenger.title} ${passenger.firstName} ${passenger.lastName}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!,
                        ),
                        subtitle: Text(
                          "${passenger.email},${passenger.phoneno}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!,
                        ),
                        trailing: Text(
                          "Seat ID : ${passenger.seat!.seatId}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!,
                        ),
                      ),
                    );
                  }),

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
                    "₹${model!.bookinDeatils!.itinerary!.price!.publishedPrice}",
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
                    "₹${model!.bookinDeatils!.itinerary!.price!.offeredPrice}",
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
                    "₹${model!.bookinDeatils!.itinerary!.price!.tDS}",
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
                    "₹${model!.bookinDeatils!.itinerary!.invoiceAmount}",
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

          ],
        ),
      ),
    );
  }
}
