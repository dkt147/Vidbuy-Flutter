import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_category_data_model/set_category_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class SettingRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<InfluencerCategoryDataModel> fetchInfluencerCategoryList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerCategoryUrl, true);
      return response = InfluencerCategoryDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<SetCategoryDataModel> fetchAddCategoryResponse(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.updateInfluencerCategoryUrl, data, true);
      print(response); // Print the raw response

      return SetCategoryDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
