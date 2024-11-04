import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/user_model/contact_us_data_model/contact_us_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class ContactUsRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<ContactUsDataModel> fetchContactUsResponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.contactUsUrl, data, true);
      print(response); // Print the raw response

      return ContactUsDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
