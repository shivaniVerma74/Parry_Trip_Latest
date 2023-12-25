import 'dart:convert';

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/constants/constant.dart';
import 'package:parry_trip2/model/tour/tour_detail_response.dart';
import 'package:parry_trip2/screens/Tour/tour_book_detail_view.dart';
import 'package:parry_trip2/widgets/AppBtn.dart';

class TourDetailScreen extends StatefulWidget {
  const TourDetailScreen({Key? key, this.slug}) : super(key: key);
final String? slug;
  @override
  State<TourDetailScreen> createState() => _TourDetailScreenState();
}

class _TourDetailScreenState extends State<TourDetailScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }
  bool isLoading = false ;
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
      body: isLoading ? const Center(child: CircularProgressIndicator(color: AppColor.activeColor,),) :  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: 300.0,
              child: Material(
                child: Carousel(
                    dotSize: 5,
                    dotSpacing: 5,
                    dotColor: Colors.black26,
                    dotIncreaseSize: 1.7,
                    dotBgColor: Colors.transparent,
                    autoplay: true,
                    boxFit: BoxFit.cover,
                    images: List.generate(
                      tourDetailsResponse?.row?.gallery?.length ?? 0,
                      (index) => Container(
                        height: 300,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(tourDetailsResponse?.row?.gallery?[index].thumb ??
                                    ''),
                                fit: BoxFit.cover)),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                tourDetailsResponse?.row?.title ?? '',
                style: const TextStyle(
                    fontFamily: "Sans",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10.0),
                width: 170.0,
                child: Row(
                  children:  [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black26,
                      size: 20,
                    ),
                    Text(
                      tourDetailsResponse?.row?.location?.name ?? '',
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: const TextStyle(
                        fontFamily: "Sans",
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                    )
                  ],
                )),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10.0),
              child: Column(children: [
                detailRowWithIcon(title: '${ tourDetailsResponse?.row?.duration} Hour',icon: Icons.alarm ),
                const SizedBox(height: 5,),
                detailRowWithIcon(title: 'Max People: ${ tourDetailsResponse?.row?.maxPeople}',icon: Icons.people ),
                const SizedBox(height: 5,),

                detailRowWithIcon(title: 'Wifi Available',icon: Icons.wifi ),
                const SizedBox(height: 5,),

                detailRowWithIcon(title: '${ tourDetailsResponse?.row?.dateFormTo}',icon: Icons.calendar_today ),
                const SizedBox(height: 5,),

                detailRowWithIcon(title: 'Min Age: ${ tourDetailsResponse?.row?.minAge}',icon: Icons.person ),
                const SizedBox(height: 5,),

                detailRowWithIcon(title: 'Pickup: ${ tourDetailsResponse?.row?.pickup}',icon: Icons.location_city_sharp ),
              ],),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
                child: bigTextView('Description')),
             /*Padding(
               padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                tourDetailsResponse?.row?.shortDesc ?? '',
                overflow: TextOverflow.clip,
                maxLines: 3,
                style: const TextStyle(
                  fontFamily: "Sans",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black26,
                ),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Html(data: "${tourDetailsResponse?.row?.content}"),
            ),
            const SizedBox(height: 20,),

            Center(
              child: BtnSearch1(
                  height: 50,
                  width: 320,
                  title: 'Book',
                  onPress: () {

                    /*showDialog(context: context, builder: (context) {
                      return AlertDialog(actions: [
                        SingleChildScrollView(
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
                                        keyboardType: TextInputType.number,
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
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(

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
                                const SizedBox(height: 20,),
                                Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Service fee:'),
                                      Text('₹100')
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: const [
                                      Text('Total:'),
                                      Text('₹1400'),

                                    ],),

                                ],),
                                const SizedBox(height: 20,),
                                BtnSearch1(
                                    height: 50,
                                    width: 100,
                                    title: 'Book Now',
                                    onPress: () {


                                    }

                                ),

                              ],)),
                      ],);
                    },);*/
                    showDialog(
                      context: context,
                      builder: (context) => showPeopleDialouge(context),
                    );


                      //Get.to(TourBookDetailScreen());

                    }

              ),
            ),
            const SizedBox(height: 20,),



          ],
        ),
      ),
    );
  }

  Widget detailRowWithIcon({required String title, required IconData icon}) {
    return Row(
      children: [
         Icon(
          icon,
          color: AppColor.activeColor,size: 20,
        ),
        SizedBox(
          width: 15,
        ),
         Text(
          title,
          style: TextStyle(
              fontFamily: "Sans",
              color: Colors.black26,
              fontWeight: FontWeight.w500,
              fontSize: 16.0),
        ),
      ],
    );
  }

  Widget bigTextView( String text){
    return  Text(
      text,
      overflow: TextOverflow.clip,
      maxLines: 3,
      style: const TextStyle(
        fontFamily: "Sans",
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColor.activeColor,
      ),
    );
  }


  TourDetailsResponse? tourDetailsResponse ;


  Future<void> getDetails() async{
    setState(() {
      isLoading= true;
    });

    var headers = {
      'Cookie': 'XSRF-TOKEN=eyJpdiI6ImRFV0lNeUVVNnRUaWt4dGxXN0tPdFE9PSIsInZhbHVlIjoielZIWHF5RzlQeUNOZnUrMmlYckg4czFheTZFcFE0SnRLQXB4NnNSNmJVTEJ0ZGE1cGdQS2w1c3JWcjZnN2g4TGlKbGYzb1V4aDN2dlJzUjRqQytEczhDYzhvOWNWSGxmTnNmQUc2RTVHbWRKeVFHbHdnRHgrNDZ4ZjdYWHd3UUUiLCJtYWMiOiJjZjZiZmNhNzY2OGJiZGVhZGJkNWI0MDZhOWViYTE4NzA1ZmUyYzRiNDVhNDU5NzIzZmZhMzMxMWQ3NDFiYzNmIiwidGFnIjoiIn0%3D; tour_and_travel_session=eyJpdiI6ImsvZ0dPT2lldHJZQ29ncytNT3VQRnc9PSIsInZhbHVlIjoidTR4bjRkOVN4L0lQNElZVlpONG1FS1YvNFJJVEVOYVlTWjVqRDFsRVFmd2JjVDhiT1lhTWJQR2p5Y1BKdGwwaU5FeFdGMWxUM3VGbVpWRUVjVWM5MWs1RnBhbDJybHp0MTBZVFlFRFRFb1RlT25Ya3ViTS82U2NBbHFrTmlLVGIiLCJtYWMiOiIyYTI2ODVkZWNlYWE4MjY2ZDdhMDJhOWM5OWFhMzU4YTY1NWE4NWMxNjJlM2E3MzViMjU1ODlhYzFhNWQ0NGY0IiwidGFnIjoiIn0%3D'
    };
    var request = http.Request('GET', Uri.parse('${baseUrl}tour/${widget.slug}'));
    print('___Surendra_______${request}_________');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = jsonDecode(result);
      tourDetailsResponse = TourDetailsResponse.fromJson(finalResult) ;

      setState(() {
        isLoading= false;
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

 int peopleCount = 0 ;
 int childCount = 0 ;

  Widget showPeopleDialouge(BuildContext cntxtt) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Align(
            alignment: Alignment.topCenter, child: Text('Select')),
        titlePadding: const EdgeInsets.only(top: 10),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Adults'),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                peopleCount++;
                              });
                            },
                            child: const Icon(Icons.add_circle_outline)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${peopleCount}'),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                if (peopleCount > 0) {
                                  peopleCount--;
                                }
                              });
                            },
                            child: Icon(Icons.remove_circle_outline)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Child'),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                childCount++;
                              });
                            },
                            child: Icon(Icons.add_circle_outline)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('${childCount}'),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                if (childCount > 0) {
                                  childCount--;
                                }
                              });
                            },
                            child: Icon(Icons.remove_circle_outline)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Service fee:'),
                      Text('₹100')
                    ],),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: const [
                      Text('Total:'),
                      Text('₹1400'),

                    ],),

                ],),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.activeColor,
                        minimumSize: const Size(double.maxFinite, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('Book Now')),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




}
