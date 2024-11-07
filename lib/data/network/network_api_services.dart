import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vidbuy_app/data/app_excaptions.dart';
import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';

class NetworkApiService implements BaseApiServices {
  ApiService() {
    initializeToken();
  }

  Future<void> initializeToken() async {
    await LocalData
        .loadToken(); // Ensure the token is loaded from SharedPreferences
  }

  // @override
  // Future<dynamic> getGettApiResponse(String url, dynamic data, dynamic includeToken) async {
  //   dynamic responseJson;
  //   try {
  //     final headers = <String, String>{
  //       'Content-Type': 'application/json',
  //     };

  //     // Check if `includeToken` is true and add token if available
  //     if (includeToken == true && LocalData.token.isNotEmpty) {
  //       headers[HttpHeaders.authorizationHeader] = 'Bearer ${LocalData.token}';
  //     }

  //     // final response =
  //     // await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));

  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: headers,
  //       body: jsonEncode(data),
  //     );
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw NoInternetException();
  //   }
  //   return responseJson;
  // }

  @override
  Future<dynamic> getGetApiResponse(String url, dynamic includeToken) async {
    dynamic responseJson;
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };

      // Check if `includeToken` is true and add token if available
      if (includeToken == true && LocalData.token.isNotEmpty) {
        headers[HttpHeaders.authorizationHeader] = 'Bearer ${LocalData.token}';
      }

      // final response =
      // await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));

      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(
      String url, dynamic data, dynamic includeToken) async {
    dynamic responseJson;
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };

      // Check if `includeToken` is true and add token if available
      if (includeToken == true && LocalData.token.isNotEmpty) {
        headers[HttpHeaders.authorizationHeader] = 'Bearer ${LocalData.token}';
      }

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("No Internet Connection");
    }
    return responseJson;
  }

  // Future getPostApiResponse(String url, data) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http.post(Uri.parse(url), body: data);
  //     // .timeout(Duration(seconds: 10));
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw NoInternetException();
  //   }
  //   return responseJson;
  // }

  @override
  Future getPostMultipartResponse(
      String url, File file, fields, dynamic includeToken) async {
    dynamic responseJson;
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };

      // Check if `includeToken` is true and add token if available
      if (includeToken == true && LocalData.token.isNotEmpty) {
        headers[HttpHeaders.authorizationHeader] = 'Bearer ${LocalData.token}';
      }
      final request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers);

      // Add the file to the request
      final filePart =
          await http.MultipartFile.fromPath('User_Profile', file.path);
      request.files.add(filePart);

      // Add any additional fields to the request
      fields.forEach((key, value) {
        request.fields[key] = value;
      });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"].toString());
      // throw BadRequestException(response.body.toString());
      case 401:
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"]);
      // throw UnauthorizedException(jsonDecode(response.body));
      case 404:
        // throw BadRequestException(response.body.toString());
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"]);
      case 403:
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"]);
      //  UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error accured while communication with server" +
                "with status code" +
                response.statusCode.toString());
    }
  }
}
