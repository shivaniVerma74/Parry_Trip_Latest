import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:parry_trip2/Library/rattings.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:parry_trip2/constants/common.dart';
import 'package:parry_trip2/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/model/tour/add_tour_detail.dart';
import 'package:parry_trip2/model/tour/tour_detail_model.dart';
import 'package:parry_trip2/screens/Tour/enquiry_form_screen.dart';
import 'package:parry_trip2/widgets/Razorpay.dart';
class TourDetailNewScreen extends StatefulWidget {

  String slug;


  TourDetailNewScreen(this.slug);

  @override
  State<TourDetailNewScreen> createState() => _TourDetailNewScreenState();
}

class _TourDetailNewScreenState extends State<TourDetailNewScreen> {
  double totalPrice = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTourDetail();
  }

  String getPercentage(String? price,String? salePrice){
    if(price!=null&&salePrice!=null){
      return (100-(double.parse(salePrice)*100)/double.parse(price)).toStringAsFixed(0)+"%";
    }
    return "";
  }
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
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: Text(
          "Tour Detail",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        actions: [
          model!=null?TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEnquiry(model: model!)));
          }, child: Text(
            "Enquiry Now",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),):const SizedBox()

        ],
      ),
      body: !loading&&model!=null?SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              model!.row!.gallery!=null?CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    height: 200.0),
                items: model!.row!.gallery!.map<Widget>((Gallery i) {
                  return commonImage(i.large,width: double.infinity);
                }).toList(),
              ):const SizedBox(height: 200,),
              Positioned(
                  left: 10,
                  top: 10,
                  child: Row(
                    children: [
                      model!.row!.isFeatured==1?Container(
                        padding:const EdgeInsets.all(8.0),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                        child: Text("Featured", style:const TextStyle(color: AppColor.activeColor,fontSize: 12,fontWeight: FontWeight.w500),),):SizedBox(),
                      SizedBox(width: 5,),
                      getPercentage(model!.row!.price, model!.row!.salePrice)!=""?Container(
                        padding:const EdgeInsets.all(8.0),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                        child: Text(getPercentage(model!.row!.price, model!.row!.salePrice), style:const TextStyle(color: AppColor.activeColor,fontSize: 12,fontWeight: FontWeight.w500),),):SizedBox(),
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
            ],),

            const SizedBox(height: 10,),
            Container(
              padding:const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    model!.row!.title ?? "",
                    style: const TextStyle(
                      fontFamily: "open-sans",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height:15,),
                  Row(children: [
                    const Icon(Icons.location_on_outlined,color: Colors.black54, size: 20,),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(
                        model!.row!.location?.name ?? '',
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style:const TextStyle(
                          fontFamily: "open-sans",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],),
                  const SizedBox(height:10,),
                  Row(
                    children: <Widget>[
                      ratingbar(
                        size: 25,
                        starRating: double.parse(model!.row!.reviewScore ?? '0.0'),
                      ),
                      const SizedBox(width: 5,),
                      const Text(
                        '4 Reviews',
                        style: TextStyle(
                            fontFamily: "open-sans",
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      )
                    ],
                  ),
                  const Divider(),
                  GridView.count(
                    shrinkWrap: true,childAspectRatio: 2.65,
                    physics:const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 5,crossAxisSpacing: 5,
                    crossAxisCount: 3,children: [
                    Row(children: [
                      const Icon(Icons.watch_later_outlined, size: 24, color:AppColor.activeColor ,),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          '${getDays(model!.row!.duration)}',
                          style:const TextStyle(
                              fontFamily: "open-sans",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                      ),

                    ],),
                    /*Row(children: [
                      const Icon(Icons.person, size: 24, color:AppColor.activeColor ,),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          'Max People ${model!.row!.maxPeople} ',
                          style:const TextStyle(
                              fontFamily: "open-sans",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                      ),

                    ],),*/
                    Row(children: [
                      const Icon(Icons.wifi, size: 24, color:AppColor.activeColor ,),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          model!.row!.wifiAvailable==1?'Wifi Available':'Wifi Unavailable',
                          style:const TextStyle(
                              fontFamily: "open-sans",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                      ),

                    ],),
                    Row(children: [
                      const Icon(Icons.calendar_today, size: 24, color:AppColor.activeColor ,),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                        '${model!.row!.dateFormTo}',
                          style:const TextStyle(
                              fontFamily: "open-sans",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                      ),

                    ],),
                    Row(children: [
                      const Icon(Icons.person, size: 24, color:AppColor.activeColor ,),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          'Min Age ${model!.row!.minAge} ',
                          style:const TextStyle(
                              fontFamily: "open-sans",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                      ),

                    ],),
                    Row(children: [
                      const Icon(Icons.location_on_outlined, size: 24, color:AppColor.activeColor ,),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          'Pickup:${model!.row!.pickup}',
                          style:const TextStyle(
                              fontFamily: "open-sans",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                      ),

                    ],),
                  ],),
                  const  Divider(),
                  const Text(
                     "Description",
                    style:  TextStyle(
                      fontFamily: "open-sans",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height:10,),
                  Html(data: model!.row!.content!),
                  const SizedBox(height:10,),
                  const Text(
                    "Price Include",
                    style:  TextStyle(
                      fontFamily: "open-sans",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height:10,),
                  model!.row!.include!=null?Column(
                    children: model!.row!.include!.map((e) =>  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(children: [
                        const Icon(Icons.check, size: 24, color:AppColor.activeColor ,),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            '${e.title}',
                            style:const TextStyle(
                                fontFamily: "open-sans",
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0),
                          ),
                        ),
                      ],),
                    ),).toList(),
                  ):SizedBox(),
                  const SizedBox(height:10,),
                  const Text(
                    "Price Exclude",
                    style:  TextStyle(
                      fontFamily: "open-sans",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height:10,),
                  model!.row!.exclude!=null?Column(
                    children: model!.row!.exclude!.map((e) =>  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(children: [
                        const Icon(Icons.close, size: 24, color:AppColor.activeColor ,),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            '${e.title}',
                            style:const TextStyle(
                                fontFamily: "open-sans",
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0),
                          ),
                        ),
                      ],),
                    ),).toList(),
                  ):SizedBox(),
                  const SizedBox(height:10,),
                  const Text(
                    "Itinerary",
                    style:  TextStyle(
                      fontFamily: "open-sans",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height:10,),
                  model!.row!.itinerary!=null?Column(
                    children: model!.row!.itinerary!.map((e) =>  ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: AppColor.activeColor,
                            ),
                            padding:const EdgeInsets.all(5.0),
                            height: 20,
                              width: 20,
                          ),
                        ],
                      ),
                      title: Text(
                        '${e.title}',
                        style:const TextStyle(
                            fontFamily: "open-sans",
                            color: AppColor.activeColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Text(
                          '${e.content}',
                          style:const TextStyle(
                              fontFamily: "open-sans",
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.0),
                        ),
                      ),
                    )).toList(),
                  ):SizedBox(),
                  const SizedBox(height:10,),
                  const Text(
                    "FAQs",
                    style:  TextStyle(
                      fontFamily: "open-sans",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height:10,),
                  model!.row!.faqs!=null?Column(
                    children: model!.row!.faqs!.map((e) =>  ExpansionTile(

                      title: Text(
                        '${e.title}',
                        style:const TextStyle(
                            fontFamily: "open-sans",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(
                            '${e.content}',
                            style:const TextStyle(
                                fontFamily: "open-sans",
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0),
                          ),
                        ),
                      ],
                    )).toList(),
                  ):SizedBox(),
                  const SizedBox(height:10,),
                  const Text(
                    "Reviews",
                    style:  TextStyle(
                      fontFamily: "open-sans",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height:10,),
                  model!.reviewList!=null?Column(
                    children: model!.reviewList!.data!.map((e) =>  ListTile(
                      leading:const Icon(
                        Icons.supervised_user_circle,
                        size: 36,
                      ),
                      title: Text(
                        '${e.title}',
                        style:const TextStyle(
                            fontFamily: "open-sans",
                            color: AppColor.activeColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Column(
                          children: [

                            ratingbar(
                              size: 12,
                              starRating: double.parse(e.rateNumber.toString() ?? '0.0'),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              '${e.content}',
                              style:const TextStyle(
                                  fontFamily: "open-sans",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.0),
                            ),
                          ],
                        ),
                      ),
                    )).toList(),
                  ):SizedBox(),
                ],
              ),
            )
          ],
        ),
      ):const Center(child: CircularProgressIndicator(),),
      bottomNavigationBar: model!=null?Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize:MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'From',
                      style: TextStyle(
                          fontFamily: 'open-sans',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          shadows: [
                            Shadow(
                              color: Colors.black12.withOpacity(0.1),
                              blurRadius: 2.0,
                            )
                          ]),
                    ),
                    SizedBox(width: 3,),
                    Text(
                      "₹${model!.row!.price}" ?? "",
                      style: const TextStyle(
                          fontFamily: 'open-sans',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      "₹ "'${model!.row!.salePrice?.split(".")[0]}',
                      style: const TextStyle(
                          fontFamily: "open-sans",
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(width: 5,),
                  ],),
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: InkWell(
                  onTap: () {
                    totalPrice = 0;
                    if(model!.row!.meta!.enablePersonTypes==1){
                      for(int i = 0;i<model!.bookingData!.personTypes!.length;i++){
                          totalPrice += double.parse(model!.bookingData!.personTypes![i].count!)*double.parse(model!.bookingData!.personTypes![i].price!);
                      }
                    }else{
                      totalPrice = double.parse(model!.row!.salePrice!);
                    }

                    if(model!.row!.meta!.enableExtraPrice==1){
                      for(int i = 0;i<model!.bookingData!.extraPrice!.length;i++){
                        if(model!.bookingData!.extraPrice![i].checked!){
                          totalPrice += double.parse(model!.bookingData!.extraPrice![i].price!);
                        }

                      }
                    }
                    for(int i = 0;i<model!.bookingData!.buyerFees!.length;i++){
                      totalPrice += double.parse(model!.bookingData!.buyerFees![i].price!);
                    }
                    if(model!.bookingData!.startDate!=null){
                      DateTime temp = DateFormat("MM/dd/yyyy").parse(model!.bookingData!.minDate!);
                      startCon.text = DateFormat("yyyy-MM-dd").format(temp);
                    }

                    showDialog(context: context, builder: (ctx){
                      return Dialog(
                        child: StatefulBuilder(
                          builder: (context,setState) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height:10,),

                                  TextFormField(
                                    controller: startCon,
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? date = await selectDate(context,startDate: model!.bookingData!.minDate!=null?DateFormat("MM/dd/yyyy").parse(model!.bookingData!.minDate!):null
                                      );
                                      if (date != null) {
                                        setState(() {
                                          startCon.text =
                                              DateFormat("yyyy-MM-dd").format(date);
                                        });
                                      }
                                    },
                                    style: Theme.of(context).textTheme.subtitle2,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: "Start Date",
                                      isDense: true,
                                      filled: true,
                                      labelStyle: Theme.of(context).textTheme.subtitle2,
                                      enabledBorder:const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                            Theme.of(context).colorScheme.primary),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height:10,),
                                  model!.row!.meta!.enablePersonTypes==1?Column(
                                    children: model!.bookingData!.personTypes!.map((e) {
                                      int index = model!.bookingData!.personTypes!.indexWhere((element) => element.name==e.name);
                                      
                                      return ListTile(
                                      leading: Text(
                                        "${e.name}",
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
                                        "${e.desc}",
                                        style:const  TextStyle(
                                          fontFamily: 'open-sans',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          IconButton(onPressed: (){




                                            if(double.parse(e.count!)>0&&double.parse(e.count!)>double.parse(e.number!)){
                                              setState((){
                                                totalPrice -= double.parse(e.price!);
                                                e.count = (double.parse(e.count!)-1).toStringAsFixed(0);

                                              });
                                            }else{

                                            }


                                          }, icon:const Icon(
                                            Icons.remove,
                                            color: AppColor.activeColor,
                                          )),
                                          Text(
                                            "${e.count}",
                                            style:const  TextStyle(
                                              fontFamily: 'open-sans',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          IconButton(onPressed: (){


                                            if(double.parse(e.count!)<=double.parse(e.max!)){
                                              setState((){
                                                e.count = (double.parse(e.count!)+1).toStringAsFixed(0);
                                                totalPrice += double.parse(e.price!);
                                              });
                                            }



                                          }, icon:const Icon(
                                              Icons.add,
                                            color: AppColor.activeColor,
                                          )),
                                        ],
                                      ),
                                      trailing: Text(
                                        "₹${e.price}",
                                        style: const TextStyle(
                                          fontFamily: 'open-sans',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,

                                        ),
                                      ),
                                    );}).toList(),
                                  ):const SizedBox(),
                                  const SizedBox(height:10,),
                                  model!.row!.meta!.enableExtraPrice==1?const Text(
                                    "Extra Price",
                                    style:  TextStyle(
                                      fontFamily: "open-sans",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ):const SizedBox(),
                                  const SizedBox(height:5,),
                                  model!.row!.meta!.enableExtraPrice==1?Column(
                                    children: model!.bookingData!.extraPrice!.map((e) =>  ListTile(
                                      leading:Checkbox(
                                        value: e.checked, onChanged: (bool? value) {
                                          setState((){
                                            if(value!){
                                              totalPrice += double.parse(e.price!);
                                            }else{
                                              totalPrice -= double.parse(e.price!);
                                            }
                                              e.checked = value;
                                          });
                                      },
                                      ),
                                      contentPadding:const EdgeInsets.symmetric(vertical: 4),
                                      horizontalTitleGap: 1,
                                      title:  Text(
                                        "${e.name}",
                                        style:  TextStyle(
                                          fontFamily: 'open-sans',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,

                                        ),
                                      ),
                                      trailing: Text(
                                        "₹${e.price}",
                                        style: const TextStyle(
                                          fontFamily: 'open-sans',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,

                                        ),
                                      ),
                                    )).toList(),
                                  ):const SizedBox(),
                                  const SizedBox(height:10,),
                                  Column(
                                    children: model!.bookingData!.buyerFees!.map((e) =>  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text(
                                          e.name!,
                                          style: const TextStyle(
                                            fontFamily: 'open-sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,

                                          ),
                                        ),
                                        Text(
                                          "₹${e.price}" ?? "",
                                          style: const TextStyle(
                                            fontFamily: 'open-sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,

                                          ),
                                        ),
                                      ],
                                    ),).toList(),
                                  ),
                                  const SizedBox(height:10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Total Price",
                                        style:  TextStyle(
                                            fontFamily: 'open-sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,

                                        ),
                                      ),
                                      Text(
                                        "₹$totalPrice" ?? "",
                                        style: const TextStyle(
                                            fontFamily: 'open-sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,

                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height:10,),
                                  InkWell(
                                    onTap: (){
                                      bookTour();
                                      return;
                                     /* RazorPayHelper razorPay = RazorPayHelper(totalPrice.toString(), (value) {if (value.toString() == "error") {
                                        Common().toast("Payment Failed");
                                      } else {
                                        if (value.toString().contains("-")) {
                                          bookTour(value.toString());
                                        } else {
                                          Common().toast("Payment Failed");
                                        }
                                      } });
                                      razorPay.init();*/
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "BOOK".toUpperCase(),
                                        style:const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        ),
                      );
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      "BOOK ⇒".toUpperCase(),
                      style:const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ):SizedBox(),
    );
  }
  DateTime startDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  Future<DateTime?> selectDate(BuildContext context,
      {DateTime? startDate}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: startDate ?? DateTime(1900),
        lastDate: DateTime(2030),
        keyboardType: TextInputType.none,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
       );

    return picked;
  }
  TextEditingController startCon = new TextEditingController();
  TourDetailModel? model;
  bool loading = false;
  void getTourDetail() async {


    setState(() {
      loading = true;
    });
    var headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey
    };

    print("${baseUrl}tour/${widget.slug}");
    var response = await http.get(Uri.parse('${baseUrl}tour/${widget.slug}')
        , headers: headers);
    print(response.body);
    Map<String,dynamic> data = jsonDecode(response.body);
    setState(() {
      loading = false;
      model=null;
    });

    if (response.statusCode == 200) {
        model = TourDetailModel.fromJson(data);
    } else {}
  }
  void bookTour() async {
    setState(() {
      loading = true;
    });
    int guestCount = 0;
    List<Map> person = [];
    if(model!.row!.meta!.enablePersonTypes==1){
      for(int i = 0;i < model!.bookingData!.personTypes!.length;i++){
        guestCount +=int.parse(model!.bookingData!.personTypes![i].count!);
        person.add(model!.bookingData!.personTypes![i].toJson());
      }
    }
    List<Map> extraPrice = [];
    if(model!.row!.meta!.enableExtraPrice==1){
      for(int i = 0;i < model!.bookingData!.extraPrice!.length;i++){
          if(model!.bookingData!.extraPrice![i].checked!){
            extraPrice.add(model!.bookingData!.extraPrice![i].toJson());
          }
      }
    }
   /* var headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey
    };*/
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer ${App.localStorage.getString("token")}'
    };

    Map param = {
      "service_type":"tour",
      "service_id":model!.row!.id.toString(),
      "start_date":startCon.text,
      "person_types":jsonEncode(person),
      "extra_price":jsonEncode(extraPrice),
      "total_price":totalPrice.toString(),
      "razorpay_payment_id":"payment_id_${getRandomString(5)}",
      "guests":guestCount.toString(),
      "booking_id":"booking_id_${getRandomString(5)}",
    };
    print("${baseUrl}booking/addToCart");
    print("$param");
    var response = await http.post(Uri.parse('${baseUrl}booking/addToCart'),body: param, headers: headers);
    print(response.body);
    Map<String,dynamic> data = jsonDecode(response.body);
    setState(() {
      loading = false;

    });

    if (response.statusCode == 200) {
      if(data['status']!=0){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTourDetail(param, data, model!)));
      }else{
        Common().toast(data['message']);
      }

    } else {
      Common().toast("Something went wrong");
    }
  }
}
