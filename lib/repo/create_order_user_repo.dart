import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/user_model/create_user_order_data_model/create_user_order_data_model.dart';
import 'package:vidbuy_app/model/user_model/influencer_video_type_data_model/influencer_video_type_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class UserCreateOrderRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<InfluencerVideoTypeDataModel> fetchInfluencerVideoType(
      String influencerId) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerVideoTypeListUrl + influencerId, true);
      print(response);
      return response = InfluencerVideoTypeDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<CreateUserOrderDataModel> fetchRequestOrderResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.userAddOrderUrl, data, true);
      print(response); // Print the raw response

      return CreateUserOrderDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
