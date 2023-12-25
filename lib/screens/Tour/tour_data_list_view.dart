import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/Library/rattings.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/model/tour/tour_location_marker_response.dart';
import 'package:parry_trip2/screens/Tour/tour_detail_new_screen.dart';
import 'package:parry_trip2/screens/Tour/tour_detail_view.dart';

class TourDataListScreen extends StatefulWidget {
  const TourDataListScreen({Key? key, this.locationId}) : super(key: key);

 final String? locationId ;

  @override
  State<TourDataListScreen> createState() => _TourDataListScreenState();
}

class _TourDataListScreenState extends State<TourDataListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTourData();
  }
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
          "Tours",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: !loading?GridView.builder(
        gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 0.62,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        padding:const EdgeInsets.all(8.0),
        itemCount: tourLocationMarkerResponse?.rows?.length ?? 0,
        itemBuilder: (context, index) {
          var item = tourLocationMarkerResponse?.rows?[index];
          return tourCard(item!);
        },
      ):const Center(child: CircularProgressIndicator(),),
    );
  }

  TourLocationMarkerResponse? tourLocationMarkerResponse ;
  String getPercentage(String? price,String? salePrice){
    if(price!=null&&salePrice!=null){
        return (100-(double.parse(salePrice)*100)/double.parse(price)).toStringAsFixed(0)+"%";
    }
    return "";
  }
  Widget tourCard(Rows item) {
    return InkWell(
      onTap: (){

        Get.to(TourDetailNewScreen( item.slug!));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                item.imageId!.isNotEmpty?ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: commonImage(item.imageId!.first.thumb ?? "",height: MediaQuery.of(context).size.height*0.16,colorBlendMode: BlendMode.srcOver,color: Colors.black.withOpacity(0.5))):Container(color: Colors.grey,height: MediaQuery.of(context).size.height*0.16),
                Positioned(
                  left: 10,
                    top: 10,

                    child: Row(
                      children: [
                        item.isFeatured==1?Container(
                          padding:const EdgeInsets.all(8.0),

                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                          child: Text("Featured", style:const TextStyle(color: AppColor.activeColor,fontSize: 12,fontWeight: FontWeight.w500),),):SizedBox(),
                        SizedBox(width: 5,),
                        getPercentage(item.price, item.salePrice)!=""?Container(
                          padding:const EdgeInsets.all(8.0),

                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                        child: Text(getPercentage(item.price, item.salePrice), style:const TextStyle(color: AppColor.activeColor,fontSize: 12,fontWeight: FontWeight.w500),),):SizedBox(),
                      ],
                    )),
                Positioned(
                    right: 10,

                    child: IconButton(
                      onPressed: (){

                      },
                      icon:const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    )),
         /*   Positioned(
              bottom: 5,
                left: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    item.categoryTour?.name ?? '',
                    style:const TextStyle(
                        fontFamily: 'open-sans',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,

                    ),
                  ),
                  Row(
                    mainAxisSize:MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Text(
                      'From',
                      style: TextStyle(
                          fontFamily: 'open-sans',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              color: Colors.black12.withOpacity(0.1),
                              blurRadius: 2.0,
                            )
                          ]),
                    ),
                    SizedBox(width: 3,),
                    Text(
                      "₹${item.price!.split(".")[0]}" ?? "",
                      style: const TextStyle(
                          fontFamily: 'open-sans',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.0,
                        decoration: TextDecoration.lineThrough
                          ),
                    ),
                      const SizedBox(width: 5,),
                      Text(
                        "₹ "'${item.salePrice?.split(".")[0]}',
                        style: const TextStyle(
                            fontFamily: "open-sans",
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(width: 5,),
                  ],),
                ],)),*/

              ],
            ),
            const SizedBox(height: 10,),
            Text(
              item.categoryTour?.name ?? '',
              style:const TextStyle(
                fontFamily: 'open-sans',
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                /*shadows: [
                          Shadow(
                            color: Colors.black12,
                            blurRadius: 2.0,
                          )
                        ]*/
              ),
            ),
            Row(
              mainAxisSize:MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const  Text(
                  'From',
                  style: TextStyle(
                      fontFamily: 'open-sans',
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.black87,
                          blurRadius: 2.0,
                        )
                      ]),
                ),
                const SizedBox(width: 3,),
                Text(
                  "₹${item.price!.split(".")[0]}" ?? "",
                  style: const TextStyle(
                      fontFamily: 'open-sans',
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.0,
                      decoration: TextDecoration.lineThrough
                  ),
                ),
                const SizedBox(width: 5,),
                Text(
                  "₹ "'${item.salePrice?.split(".")[0]}',
                  style: const TextStyle(
                      fontFamily: "open-sans",
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 5,),
              ],),
            Container(
                padding: const EdgeInsets.only(left: 0, top: 10.0),

                child:  Row(children: [
                  const Icon(Icons.location_on_outlined,color: Colors.black54, size: 20,),
                  Expanded(
                    child: Text(
                      item.location?.name ?? '',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style:const TextStyle(
                        fontFamily: "open-sans",
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],)),
            Container(
              padding: const EdgeInsets.only(left: 8.0, top: 5.0,right: 8.0),
              child: Text(
                item.title ?? "",
                style: const TextStyle(
                  fontFamily: "open-sans",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ratingbar(

                        starRating: double.parse(item.reviewScore ?? '0.0'),
                      ),
                      const SizedBox(width: 5,),
                      const Text(
                        '4 Reviews',
                        style: TextStyle(
                            fontFamily: "open-sans",
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(children: [
                const Icon(Icons.watch_later_outlined, size: 16, color:Colors.black26 ,),
                const SizedBox(width: 5,),
                Text(
                  '${getDays(item.duration)}',
                  style:const TextStyle(
                      fontFamily: "open-sans",
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0),
                )

              ],),
            ),
          ],
        ),
      ),
    );
  }
  getDays(int? duration){
    if(duration!=null){
      int days = duration ~/ 24;
      int hour = duration % 24;
      return "${days}d ${hour}h";
    }
    return "Not Available";
  }
  bool loading = false;
  Future<void> getTourData() async {
    setState(() {
      loading = true;
    });
    var request = http.MultipartRequest('GET', Uri.parse('https://tour.alphawizzserver.com/api/tour?location_id=${widget.locationId}'));
    request.fields.addAll({
      'location_id': widget.locationId  ?? '10'
    });
    print('_______asxsaxsx____${request.fields}__________');


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = jsonDecode(result) ;

      if(finalResult['rows'] !=null){

        setState(() {
          loading =false;
          tourLocationMarkerResponse = TourLocationMarkerResponse.fromJson(finalResult);
        });
      }
    }
    else {
      print(response.reasonPhrase);
    }

  }


}
