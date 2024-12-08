import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/user_model/influencer_detail_data_model/influencer_detail_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_add_view_data_model/user_add_view_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class InfluencerDetailRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<InfluencerDetailDataModel> fetchinfluencerDetail(
      String influencerId) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerDetailUrl + influencerId, true);
      return response = InfluencerDetailDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserAddViewDataModel> fetchInfluencerView(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.userAddViewUrl, data, true);
      return response = UserAddViewDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
