import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vidbuy_app/services/alert.service.dart';
import 'dart:convert';
import 'package:vidbuy_app/services/api.service.dart';
import 'package:vidbuy_app/services/utility.service.dart';

class NetworkService {
  final Logger _logger = Logger();
  final AlertsService ase = AlertsService();
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

  Future<dynamic> register(Map<String, dynamic> data) async {
    return await httpPostResponse('signup-via-email', data);
  }

  Future<dynamic> verifySignUp(Map<String, dynamic> data) async {
    return await httpPostResponse('verify-signup', data);
  }

  Future<dynamic> getCategory() async {
    return await httpGetResponse('category/list');
  }

  Future<dynamic> getInfluencers() async {
    return await httpGetResponse('influencer/list');
  }

  Future<dynamic> getUserByEmail(String email) async {
    return await httpGetResponse('user-by-email?email=$email');
  }

  // Function to serialize the request body
  String serialize(Map<String, dynamic> obj) {
    List<String> str = [];
    obj.forEach((key, value) {
      str.add(
          '${Uri.encodeComponent(key)}=${Uri.encodeComponent(value.toString())}');
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
  Future<dynamic> httpPutResponse(String key, Map<String, dynamic> data,
      {String? id}) async {
    return await httpResponse(
      'put',
      key,
      data,
      id: id,
    );
  }

  // Generic PATCH method handler
  Future<dynamic> httpPatchResponse(String key, Map<String, dynamic> data,
      {String? id}) async {
    return await httpResponse(
      'patch',
      key,
      data,
      id: id,
    );
  }

  // Generic DELETE method handler
  Future<dynamic> httpDeleteResponse(String key,
      {bool showLoader = true}) async {
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
      late Map<String, dynamic> response;

      // Switch based on request type (GET, POST, etc.)
      if (type == 'get') {
        response = await api.get(url);
      } else if (type == 'post') {
        response = await api.post(url, data);
      } else if (type == 'put') {
        // response = await api.put(url, data);
      } else if (type == 'patch') {
        // response = await api.patch(url, data);
      } else {
        throw Exception('Unsupported HTTP request type: $type');
      }

      if (showLoader) {
        // utility.hideLoader();
      }

      // Decode and return the JSON response
      var json = response;
      _logger.e(json);

      if (json['bool'] == false && showError) {
        ase.presentFailureToast(json['message']);
      }

      return json['result'];
    } catch (err) {
      _logger.t(err);
      // if (showLoader) {
      //   // utility.hideLoader();
      // }

      // // Display failure toast for error messages
      // // utility.presentFailureToast(err.toString());

      // // Handle 401 Unauthorized error
      // if (err is Response && err.statusCode == 401) {
      //   // Clear any stored session or token information
      //   // Optionally: Use SharedPreferences to manage token storage
      //   // SharedPreferences prefs = await SharedPreferences.getInstance();
      //   // prefs.remove('token');
      //   // prefs.remove('user_role');

      //   // Navigate to the login page (using Navigator)
      //   // Router.navigate([''] as BuildContext); // Adjust to actual navigation in Flutter
      // }

      // // Rethrow the error for further handling
      // return jsonDecode({'message': ''} as String);
      // //throw err.toString();
    }
  }
}
