import 'dart:io';

import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/generic_otp_data_model/generic_otp_data_model.dart';
import 'package:vidbuy_app/model/generic_signup_data_model/generic_signup_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/country_list_data_model/country_list_data_model.dart';
import 'package:vidbuy_app/model/upload_image_data_model/upload_image_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class SignupRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<GenericSignupDataModel> fetchGenericSignupResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.genericSignupUrl, data, true);
      print(response); // Print the raw response

      return GenericSignupDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<GenericOtpDataModel> fetchGenericOtpResponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.verifyOtpUrl, data, true);
      print(response); // Print the raw response

      return GenericOtpDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UploadImageDataModel> fetchUploadImageResponse(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.uploadImageUrl, data, true);
      print(response); // Print the raw response

      return UploadImageDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UploadImageDataModel> fetchUploadVideoResponse(
      dynamic data, File file) async {
    try {
      dynamic response = await apiServices.getPostMultipartResponse(
          AppUrl.uploadImageUrl, file, data, true);
      print(response); // Print the raw response
      return UploadImageDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> fetchCountryList({int page = 1}) async {
    try {
      // Include page number in the API request
      final response = await apiServices.getGetApiResponse(
        AppUrl.countryListUrl + "?page=$page",
        false,
      );
      return response; // Returns the data as expected
    } catch (e) {
      throw e; // Error handling
    }
  }

// Future<SocietyDataModel> fetchAdminSignupResponse() async {
//     try {
//       dynamic response = await apiServices.getGetApiResponse(AppUrl.societyUrl);
//       return response = SocietyDataModel.fromJson(response);
//     } catch (e) {
//       throw e;
//     }
//   }

  // Future<UserSignupDataModel> fetchInfluencerSignupResponse(dynamic data) async {
  //   try {
  //     dynamic response =
  //         await apiServices.getPostApiResponse(AppUrl.influencerSignupUrl, data);
  //     return response = UserSignupDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
