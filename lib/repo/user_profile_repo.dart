import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/delete_account_data_model.dart';
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
}
