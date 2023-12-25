import 'package:intl/intl.dart';

bool live = false;
const baseUrl = "https://tour.alphawizzserver.com/api/";
String flightUrl = live?"https://api.tripjack.com/":"https://apitest.tripjack.com/";
const bustUrl = "http://api.tektravels.com/SharedServices/SharedData.svc/rest/";
const busBookingUrl = "http://api.tektravels.com/BookingEngineService_Bus/Busservice.svc/rest/";
String apiKey = live?"61075878cf0bfdc3-5b33-4da8-b4b0-355e77498f58":"812146ac5e380f-ed6f-4a76-a035-314f4255eddb";
final int timeOut = 60;
const int perPage =10;

String name = "", firstName = "", lastName = "", email = "", password = "", profile = "";

String numberFormat(double? numberToComma) {
  print("valuee iss $numberToComma");
  var formatter = NumberFormat('#,##,000');
    var num=  formatter.format(numberToComma);

  return num.toString();
}