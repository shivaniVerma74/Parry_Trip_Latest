import 'package:flutter/material.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/widgets/AppBtn.dart';

class TourBookDetailScreen extends StatefulWidget {
  const TourBookDetailScreen({Key? key}) : super(key: key);

  @override
  State<TourBookDetailScreen> createState() => _TourBookDetailScreenState();
}

class _TourBookDetailScreenState extends State<TourBookDetailScreen> {
  getDays(int? duration){
    if(duration!=null){
      int days = duration ~/ 24;
      int hour = duration % 24;
      return "${days}d ${hour}h";
    }
    return "Not Available";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Sofia",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BtnSearch1(
            height: 50,
            title: 'Book Now',
            onPress: () {


            }

        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
          child: Column(
        children: [
          const SizedBox(height: 50,),
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                onChanged: (String value) {
                  setState(() {
                    //widget.passengerList[index].fName = value;
                  });
                },
                decoration:  const InputDecoration(
                  isDense: true,
                  hintText: "Age 18+",
                  labelText: "Adult",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                onChanged: (String value) {
                  setState(() {
                   // widget.passengerList[index].lName = value;
                  });
                },
                decoration: InputDecoration(

                  hintText: "Age 6-17",
                  label: Text('Child'),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),


          ],
        ),
        SizedBox(height: 20,),
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(' Service fee'),
            Text('₹100')
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
            const Text('Total'),
            Text('₹1.400'),

          ],),

        ],),

      ],)),
    );
  }
}
