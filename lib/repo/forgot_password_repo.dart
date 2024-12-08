import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/forgot_password_data_model.dart';
import 'package:vidbuy_app/model/forgot_password_email_data_model/forgot_password_email_data_model.dart';
import 'package:vidbuy_app/model/forgot_password_otp_data_model.dart';
import 'package:vidbuy_app/model/user_model/contact_us_data_model/contact_us_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class ForgotPasswordRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<ForgotPasswordEmailDataModel> fetchForgetPasswordEmailResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.forgotPasswordEmailUrl, data, true);
      print(response); // Print the raw response

      return ForgotPasswordEmailDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ForgotPasswordOtpDataModel> fetchForgetPasswordOtpResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.forgotPasswordOtpUrl, data, true);
      print(response); // Print the raw response

      return ForgotPasswordOtpDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ForgotPasswordDataModel> fetchForgetPasswordResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.forgotPasswordUrl, data, true);
      print(response); // Print the raw response

      return ForgotPasswordDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
