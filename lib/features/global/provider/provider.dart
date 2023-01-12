import '../../../core/open_api_core.dart';

//private End point
String endPoint(String endPoint) => "$baseURL/$endPoint";

//Passing headers
Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
