import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/delete_account_data_model.dart';
import 'package:vidbuy_app/model/notifications_data_model/notifications_data_model.dart';
import 'package:vidbuy_app/model/nottifications_setting_data_model/nottifications_setting_data_model.dart';
import 'package:vidbuy_app/model/user_model/change_password_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_edit_profile_data_model/user_edit_profile_data_model.dart';
import 'package:vidbuy_app/model/verify_passwrod_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class UserProfileRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<VerifyPasswrodDataModel> fetchVerifyPassword(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.verifyPasswordUrl, data, true);
      print(response); // Print the raw response

      return VerifyPasswrodDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DeleteAccountDataModel> fetchDeleteAccountResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.deleteAccountUrl, data, true);
      print(response); // Print the raw response

      return DeleteAccountDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DeleteAccountDataModel> fetchLogOutAccountResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.logoutAccountUrl, data, true);
      print(response); // Print the raw response

      return DeleteAccountDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserEditProfileDataModel> fetchUserEditProfileResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.userEditProfileUrl, data, true);
      print(response); // Print the raw response

      return UserEditProfileDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ChangePasswordDataModel> fetchChangePasswordResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.changePasswordUrl, data, true);
      print(response); // Print the raw response

      return ChangePasswordDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

//Notifications API

  Future<NotificationsDataModel> fetchNotificationsResponse(int page) async {
    try {
      final String paginatedQuery = '?page=$page';
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.notificationsUrl + paginatedQuery, true);
      print(response); // Print the raw response
      return NotificationsDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<NottificationsSettingDataModel> fetchNotificationSettingResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.notificationsSettingUrl, data, true);
      print(response); // Print the raw response

      return NottificationsSettingDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
