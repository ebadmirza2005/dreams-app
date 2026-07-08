import 'dart:convert';


import 'app_exceptions.dart';
import 'storage_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> _getToken() async {
    return await StorageService.getToken();
  }

  static Map<String, String> _headers(String? token) => {
    "Accept": "application/json",
    if (token != null) "Authorization" : "Bearer $token"
  };

  static dynamic _returnResponse(http.Response response) {
    dynamic responseJson;
    try {
      responseJson = json.decode(response.body);
    }catch (_) {
      responseJson = null;
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        String errMsg = responseJson?['message'] ?? response.body.toString();
        throw BadRequestException(errMsg);
      case 401:
        String errMsg = responseJson?['message'] ?? response.body.toString();
        throw UnauthorisedException();
      case 403:
        throw UnauthorisedException((response.body.toString()));
      case 500:
      default:
        throw FetchDataException(
          "Error ocurred while Communication with Server with StatusCode : ${response.statusCode}"
        );
    }
  }

}