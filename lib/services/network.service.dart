import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vidbuy_app/services/api.service.dart';
import 'package:vidbuy_app/services/utility.service.dart';

class NetworkService {
  final ApiService api;
  // final UtilityService utility;

  NetworkService({
    required this.api,
    // required this.utility,
  });

  // Authentication Related APIs
  Future<dynamic> login(Map<String, dynamic> data) async {
    return await httpPostResponse('login', data);
  }

  // Function to serialize the request body
  String serialize(Map<String, dynamic> obj) {
    List<String> str = [];
    obj.forEach((key, value) {
      str.add('${Uri.encodeComponent(key)}=${Uri.encodeComponent(value.toString())}');
    });
    return str.join('&');
  }

  // Generic POST method handler
  Future<dynamic> httpPostResponse(
    String key,
    Map<String, dynamic> data, {
    String? id,
    bool showLoader = true,
    bool showError = true,
    String contentType = 'application/json',
  }) async {
    return await httpResponse(
      'post',
      key,
      data,
      id: id,
      showLoader: showLoader,
      showError: showError,
      contentType: contentType,
    );
  }

  // Generic GET method handler
  Future<dynamic> httpGetResponse(
    String key, {
    String? id,
    bool showLoader = true,
    bool showError = true,
    String contentType = 'application/json',
  }) async {
    return await httpResponse(
      'get',
      key,
      {},
      id: id,
      showLoader: showLoader,
      showError: showError,
      contentType: contentType,
    );
  }

  // Generic PUT method handler
  Future<dynamic> httpPutResponse(String key, Map<String, dynamic> data, {String? id}) async {
    return await httpResponse(
      'put',
      key,
      data,
      id: id,
    );
  }

  // Generic PATCH method handler
  Future<dynamic> httpPatchResponse(String key, Map<String, dynamic> data, {String? id}) async {
    return await httpResponse(
      'patch',
      key,
      data,
      id: id,
    );
  }

  // Generic DELETE method handler
  Future<dynamic> httpDeleteResponse(String key, {bool showLoader = true}) async {
    if (showLoader) {
      // utility.showLoader();
    }
    var response = await api.delete(key);
    // utility.hideLoader();
    return response;
  }

  // Generic HTTP request handler for GET, POST, PUT, PATCH
  Future<dynamic> httpResponse(
    String type,
    String key,
    Map<String, dynamic> data, {
    String? id,
    bool showLoader = true,
    bool showError = true,
    String contentType = 'application/json',
  }) async {
    try {
      if (showLoader) {
        // utility.showLoader();
      }

      String url = key + (id != null ? '/$id' : '');
      late http.Response response;

      // Switch based on request type (GET, POST, etc.)
      if (type == 'get') {
        response = await api.get(url);
      } else if (type == 'post') {
        response = await api.post(url, data);
      } else if (type == 'put') {
        response = await api.put(url, data);
      } else if (type == 'patch') {
        response = await api.patch(url, data);
      } else {
        throw Exception('Unsupported HTTP request type: $type');
      }

      if (showLoader) {
        // utility.hideLoader();
      }

      // Decode and return the JSON response
      return jsonDecode(response.body);
    } catch (err) {
      if (showLoader) {
        // utility.hideLoader();
      }

      // Display failure toast for error messages
      // utility.presentFailureToast(err.toString());

      // Handle 401 Unauthorized error
      if (err is http.Response && err.statusCode == 401) {
        // Clear any stored session or token information
        // Optionally: Use SharedPreferences to manage token storage
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.remove('token');
        // prefs.remove('user_role');
        
        // Navigate to the login page (using Navigator)
        // Router.navigate([''] as BuildContext); // Adjust to actual navigation in Flutter
      }

      // Rethrow the error for further handling
      throw err;
    }
  }
}
