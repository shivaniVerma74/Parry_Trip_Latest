import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/model/tour/search_tour_city_response.dart';

class SearchTourPlaceScreen extends StatefulWidget {
  const SearchTourPlaceScreen({Key? key}) : super(key: key);

  @override
  State<SearchTourPlaceScreen> createState() => _SearchTourPlaceScreenState();
}

class _SearchTourPlaceScreenState extends State<SearchTourPlaceScreen> {
  final fromController = TextEditingController();
  bool isLoading = false ;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCity("");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: colors.activeColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Colors.white,),),
        title: const Text("Location", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(child: Column(children: [
          TextFormField(
            onChanged: (vlaue){
              //getSuggestions(vlaue);
              print('___________${vlaue}__________');
              getCity(vlaue) ;
            },
            controller: fromController,
            decoration: InputDecoration(
                hintText: 'Search Place'
            ),
          ),
          const SizedBox(height: 20,),
          isLoading ? const Center(child: CircularProgressIndicator(),):
          tourSearchDataList.isEmpty ? const Text('City not available') :
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tourSearchDataList.length,
            itemBuilder: (context, index) {
              return InkWell(onTap: (){
               Navigator.pop(context, [tourSearchDataList[index]]);
              },
                child: ListTile(
                  trailing: const Icon(Icons.location_on),
                  title: Text(tourSearchDataList[index].title ?? ''),),
              );
            },)
        ],),),
      ),
    );
  }
  List <TourSerachDataList> tourSearchDataList = [] ;

  Future<void> getCity( String value) async{
    isLoading = true ;
    setState(() {

    });
    var request = http.MultipartRequest('GET', Uri.parse('https://tour.alphawizzserver.com/api/locations?service_name=${value}'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    var result =  await response.stream.bytesToString();
    var finalResult = jsonDecode(result);

    if(finalResult['total'] > 0){
      tourSearchDataList = SearchTourCityResponse.fromJson(finalResult).data ?? [] ;
      setState(() {
        isLoading = false ;
      });
    }else {

      setState(() {
        isLoading = false ;
      }) ;

    }

    }
    else {
      print(response.reasonPhrase);
    }

  }
}
