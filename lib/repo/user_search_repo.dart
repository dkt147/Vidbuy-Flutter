import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/user_model/influencer_list_by_category_data_model/influencer_list_by_category_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class UserSearchRepo {
  final BaseApiServices apiServices = NetworkApiService();

  Future<InfluencerCategoryDataModel> fetchCategoryList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerCategoryUrl, true);
      return response = InfluencerCategoryDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerListByCategoryDataModel> fetchInfluencerByCategory(
      String categoryId) async {
    try {
      final String url =
          "${AppUrl.influencersListByCategoryUrl}?category_id=$categoryId";
      dynamic response = await apiServices.getGetApiResponse(url, true);
      print(response); // Print the raw response

      return InfluencerListByCategoryDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<InfluencersListDataModel> fetchInfluencersListBy(
  //     {required int page}) async {
  //   try {
  //     // Add the page parameter to the URL as a query parameter
  //     final String url = "${AppUrl.influencersListUrl}?page=$page";

  //     dynamic response = await apiServices.getGetApiResponse(url, true);
  //     return InfluencersListDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
