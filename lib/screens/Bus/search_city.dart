import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parry_trip2/constants/ApiBaseHelper.dart';
import 'package:parry_trip2/constants/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:parry_trip2/model/bus_model/bus_city_list_response.dart';

import '../../model/Bus_Search_Model.dart';


class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({Key? key, required this.isFrom}) : super(key: key);
 final bool isFrom;


  @override
  State<SearchCityScreen> createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  bool isLoading = false ;
   // List <BusCity> busCity = [] ;
   List <SearchData> busCity = [] ;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getBusCityList();
    // busSearchApi(value);
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
            onChanged: (value){
              //getSuggestions(vlaue);
              // print('___________${vlaue}__________');
              searchProduct(value) ;
             // busSearchApi(value);
            },
            controller: widget.isFrom ? fromController : toController,
            decoration: InputDecoration(
                hintText: widget.isFrom ? 'From' : 'To'
            ),
          ),
          const SizedBox(height: 20,),
          isLoading ? const Center(child: CircularProgressIndicator(),):
              busCity.isEmpty ? const Text('City not available') :
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:busCity.length, /*< 150 ? busCity.length :150,*/
            itemBuilder: (context, index) {
            return InkWell(onTap: (){
              Navigator.pop(context,[busCity[index], widget.isFrom ? true : false]);
            },
              child: ListTile(
                trailing: const Icon(Icons.location_on),
                title: Text(busCity[index].title ?? ''),),
            );
          },)
        ],),),
      ),
    );
  }

  // BusSearchModel? busSearchModel;
  busSearchApi(String? value) async {
    isLoading = true ;
    setState(() {

    });
    print('_____sure_____${value}_________');
    var headers = {
      'Cookie': 'XSRF-TOKEN=eyJpdiI6ImV4VXNwUUlta21PcExBeGlTc2RqNUE9PSIsInZhbHVlIjoiZmpsMUlzZnk4NHNSSGhXamhOYTlNZFBFMnFWcWU1Tm94M3k3SDdYUnhBRUl0Q0Z3Q05HQnhiNVZwY0pBMUVjNkNwbzcxcDZjaUc4TzhSSGM3OEhFcG5yNm14bi81Uk5nWks1TDdNS3Yxa25DdmVlNVhTNWVHbWNtSjVNazd1b3MiLCJtYWMiOiI4NTZiNDlmYWM3ZGZkOTE0OWQzYWJiZTRlMDVkM2M4YmI0ZTMyYzQ0ODljMDNlNzU4ZjM2ZWY1NDQxYWM0YjQ0IiwidGFnIjoiIn0%3D; tour_and_travel_session=eyJpdiI6IkJ2SllKZ09rT045eUZnU0JIVDljeHc9PSIsInZhbHVlIjoiWXVsU09YQ2liNjhlQ04zdlg4bVpLNWVWbXdJUk9FT1gyTjE4emtnYzgzS0E4UENLZFRkMHhLTURmWmFSaFdNMENPOHdkYS9iSDFMaDFDOFVhSGhOL3ZvOG5INXpmNkdDYUtxdFJBSHZWVTY0MkFJcGVsWkV3YlpJVW5KYXRobloiLCJtYWMiOiJmNmEwM2Y0NWJhMWU3MzIyOTAzMDlhNGY3YjBjMTM0YThhZjA1OWQ1MTIyOGU2MzUyMzdiNTE2Mzg4ZjJlOGQwIiwidGFnIjoiIn0%3D'
    };
    var request = http.Request('GET', Uri.parse('https://tour.alphawizzserver.com/location/search/searchForBusCitySelect?search=${value}'));
    request.headers.addAll(headers);
    print('____http.Request______${http.Request}____${request}_____');
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       var finalResult =  await response.stream.bytesToString();
       var jsonResponce = BusSearchModel.fromJson(jsonDecode(finalResult));
       print('____finalResult______${finalResult}_________');
       setState(() {
         busCity = jsonResponce.data ?? [] ;
         isLoading = false ;
       });
    }
    else {
      isLoading = false ;
      setState(() {});
      {
    }
    print(response.reasonPhrase);
    }

  }
  // Future<void> getBusCityList() async{
  //   isLoading = true ;
  //   setState(() {
  //
  //   });
  //   var headers = {
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request('POST', Uri.parse('http://api.tektravels.com/SharedServices/StaticData.svc/rest/GetBusCityList'));
  //   request.body = json.encode({
  //     "TokenId": busToken,
  //     "IpAddress": "192.168.11.120",
  //     "ClientId": "ApiIntegrationNew"
  //   });
  //   print('_______Surendra___${request.body}_________');
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   print("_______${request.body}_______");
  //
  //   if (response.statusCode == 200) {
  //    var result =  await response.stream.bytesToString();
  //    var finalResult = BusCityListResponse.fromJson(jsonDecode(result));
  //
  //    busCity = finalResult.busCities ?? [] ;
  //
  //
  //
  //    isLoading = false ;
  //    setState(() {});
  //
  //   }
  //   else {
  //     isLoading = false ;
  //     setState(() {});
  //     print(response.reasonPhrase);
  //   }
  // }

  searchProduct(String value) {
    if (value.isEmpty) {
      busSearchApi(value);
      setState(() {});
    } else if(value.length==4){
      busSearchApi(value);
      final suggestions = busCity.where((element) {
        final productTitle = element.title!.toLowerCase();
        final input = value.toLowerCase();
        return productTitle.contains(input);
      }).toList();
      busCity = suggestions;
      setState(() {

      });
    }
    else{
      final suggestions = busCity.where((element) {
        final productTitle = element.title!.toLowerCase();
        final input = value.toLowerCase();
        return productTitle.contains(input);
      }).toList();
      busCity = suggestions;
      setState(() {

      });
    }
  }


}
