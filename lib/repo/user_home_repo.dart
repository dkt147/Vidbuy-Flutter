import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/user_model/give_away_data_model/give_away_data_model.dart';
import 'package:vidbuy_app/model/user_model/recently_added_data_model/recently_added_data_model.dart';
import 'package:vidbuy_app/model/user_model/trending_influencers_data_model/trending_influencers_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class UserHomeRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<InfluencerCategoryDataModel> fetchCategoryList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerCategoryUrl, true);
      return response = InfluencerCategoryDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<TrendingInfluencersDataModel> fetchTrendingInfluencersList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.trendingInfluencerUrl, true);
      return response = TrendingInfluencersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<GiveAwayDataModel> fetchGiveAwayList() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppUrl.giveAwayUrl, true);
      return response = GiveAwayDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<RecentlyAddedDataModel> fetchRecentlyAddedList() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppUrl.recentlyAddedUrl, true);
      return response = RecentlyAddedDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
