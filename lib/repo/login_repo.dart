import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/login_data_model/login_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class LoginRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<LoginDataModel> fetchLoginResponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginUrl, data, false);
      print(response); // Print the raw response

      return LoginDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
