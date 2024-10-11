import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:vidbuy_app/services/interceptor.service.dart';

http.Response dioResponseToHttpResponse(Response dioResponse) {
  return http.Response(
    dioResponse.data, // Body of the response (string format)
    dioResponse.statusCode ?? 500, // Status code, defaults to 500 if null
    headers: Map<String, String>.from(dioResponse.headers.map),
    request: http.Request(
      dioResponse.requestOptions.method, // HTTP method
      Uri.parse(dioResponse.requestOptions.path), // Request URL
    ),
  );
}

class ApiService {
  final Logger _logger = Logger();
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'http://influenzers.duckdns.org/api/'));

  ApiService() {
    // Attach interceptor
    _dio.interceptors.add(InterceptorService());
  }

  // GET request
  Future<http.Response> get(String endpoint,
      {Map<String, String>? params}) async {
    Response dioResponse = await _dio.get(endpoint, queryParameters: params);
    http.Response httpResponse = dioResponseToHttpResponse(dioResponse);
    return httpResponse;

    // var uri = Uri.parse('$url/$endpoint').replace(queryParameters: params);
    // return await http.get(uri);
  }

  // POST request
  Future<http.Response> post(String endpoint, dynamic body) async {
    try {
      Response dioResponse = await _dio.post(endpoint, data: body);
      _logger.t(dioResponse.data);
      http.Response httpResponse = dioResponseToHttpResponse(dioResponse);
      return httpResponse;
    } catch (e) {
      if (e is DioException) {
        // Check if DioError has a response
        if (e.response != null && e.response?.data['message'] != null) {
          String errorMessage = e.response?.data['message'];

          Map<String, dynamic> errorResponse = {
            "message": errorMessage
          };

          // _logger.t(errorMessage);
          return http.Response(
            jsonEncode(errorResponse), 
            e.response?.statusCode ?? 500, 
            headers: {'Content-Type': 'application/json'}
          );
        }
      }

      // _logger.t(e.toString());
      return http.Response('An unknown error occurred', 500);
    }
    // return await http.post(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }

  // PUT request
  Future<http.Response> put(String endpoint, dynamic body) async {
    Response dioResponse = await _dio.put(endpoint, data: body);
    http.Response httpResponse = dioResponseToHttpResponse(dioResponse);
    return httpResponse;
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.put(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }

  // DELETE request
  Future<http.Response> delete(String endpoint) async {
    Response dioResponse = await _dio.delete(endpoint);
    http.Response httpResponse = dioResponseToHttpResponse(dioResponse);
    return httpResponse;
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.delete(uri);
  }

  // PATCH request
  Future<http.Response> patch(String endpoint, dynamic body) async {
    Response dioResponse = await _dio.patch(endpoint, data: body);
    http.Response httpResponse = dioResponseToHttpResponse(dioResponse);
    return httpResponse;
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.patch(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }
}
