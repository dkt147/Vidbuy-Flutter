import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_review_data_model/influencer_review_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_video_type_data_model/influencer_video_type_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/price_range_data_model/price_range_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_category_data_model/set_category_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_price_data_model/set_price_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_price_range_data_model/set_price_range_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_video_type_data_model/set_video_type_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class InfluencerSelectionRepo {
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

  Future<InfluencerVideoTypeDataModel> fetchInfluencerVideoTypeList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerVideoTypeUrl, true);
      return response = InfluencerVideoTypeDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerReviewDataModel> fetchInfluencerReviewList() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppUrl.influencerReviewUrl, true);
      return response = InfluencerReviewDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<PriceRangeDataModel> fetchInfluencerPriceRangeList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerPriceRangeUrl, true);
      return response = PriceRangeDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<SetCategoryDataModel> fetchAddCategoryResponse(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.setInfluencerCategoryUrl, data, true);
      print(response); // Print the raw response

      return SetCategoryDataModel.fromJson(response);
    } catch (e) {
      throw Exception("Error fetching signup response: $e");
    }
  }

  Future<SetVideoTypeDataModel> fetchAddVideoTypeResponse(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.influencerAddVideoTypeUrl, data, true);
      print(response); // Print the raw response

      return SetVideoTypeDataModel.fromJson(response);
    } catch (e) {
      throw Exception("Error fetching signup response: $e");
    }
  }

  Future<SetPriceRangeDataModel> fetchAddPriceRangeResponse(
      dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.influencerAddPriceRangeUrl, data, true);
      print(response); // Print the raw response

      return SetPriceRangeDataModel.fromJson(response);
    } catch (e) {
      throw Exception("Error fetching signup response: $e");
    }
  }

  Future<SetPriceDataModel> fetchAddPriceResponse(
      dynamic data, String id) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.influencerAddPriceUrl + id, data, true);
      print(response); // Print the raw response

      return SetPriceDataModel.fromJson(response);
    } catch (e) {
      throw Exception("Error fetching signup response: $e");
    }
  }
}
