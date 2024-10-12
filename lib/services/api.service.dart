import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vidbuy_app/services/interceptor.service.dart';
import 'package:vidbuy_app/constants/config.dart'; // Import your config file

class ApiService {
  final Logger _logger = Logger();
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  ApiService() {
    // Attach interceptor
    _dio.interceptors.add(InterceptorService());
  }

  // GET request
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String>? params}) async {
    try {
      Response dioResponse = await _dio.get(endpoint, queryParameters: params);
      _logger.e(dioResponse);
      // Return the response if the request is successful
      Map<String, dynamic> successResponse = {
        "bool": dioResponse.data['bool'],
        "status": dioResponse.data['status'],
        "message": dioResponse.data['message'],
        "result": dioResponse.data['result'],
      };

      return successResponse;
    } catch (e) {
      Map<String, dynamic> errorPacket = {
        "bool": false,
        "message": "An unknown error occurred",
        "status": 500,
        "result": null
      };

      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          // Attempt to extract error message and status from the server response
          String message = e.response?.data['message'] ?? "An error occurred";
          int status = e.response?.statusCode ?? 500;

          errorPacket['message'] = message;
          errorPacket['status'] = status;
        }
      } else {
        // Handle non-Dio exceptions
        errorPacket['message'] = e.toString();
        errorPacket['status'] = 500;
      }

      // Optionally log the error
      // _logger.e(errorPacket['message']);

      return errorPacket;
    }
    // var uri = Uri.parse('$url/$endpoint').replace(queryParameters: params);
    // return await http.get(uri);
  }

  // POST request
  Future<Map<String, dynamic>> post(String endpoint, dynamic body) async {
    try {
      // Make the POST request using Dio
      Response dioResponse = await _dio.post(endpoint, data: body);

      // Return the response if the request is successful
      Map<String, dynamic> successResponse = {
        "bool": dioResponse.data['bool'],
        "status": dioResponse.data['status'],
        "message": dioResponse.data['message'],
        "result": dioResponse.data['result'],
      };

      return successResponse;
    } catch (e) {
      Map<String, dynamic> errorPacket = {
        "bool": false,
        "message": "An unknown error occurred",
        "status": 500,
        "result": null
      };

      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          // Attempt to extract error message and status from the server response
          String message = e.response?.data['message'] ?? "An error occurred";
          int status = e.response?.statusCode ?? 500;

          errorPacket['message'] = message;
          errorPacket['status'] = status;
        }
      } else {
        // Handle non-Dio exceptions
        errorPacket['message'] = e.toString();
        errorPacket['status'] = 500;
      }

      // Optionally log the error
      // _logger.e(errorPacket['message']);

      return errorPacket;
    }
  }

  // PUT request
  Future<Response> put(String endpoint, dynamic body) async {
    Response dioResponse = await _dio.put(endpoint, data: body);
    return dioResponse;
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.put(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }

  // DELETE request
  Future<Response> delete(String endpoint) async {
    Response dioResponse = await _dio.delete(endpoint);
    return dioResponse;
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.delete(uri);
  }

  // PATCH request
  Future<Response> patch(String endpoint, dynamic body) async {
    Response dioResponse = await _dio.patch(endpoint, data: body);
    return dioResponse;
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.patch(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }
}
