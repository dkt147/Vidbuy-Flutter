import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/user_model/influencers_list_data_model/influencers_list_data_model.dart';
import 'package:vidbuy_app/model/user_model/trending_influencers_data_model/trending_influencers_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class UserSearchRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<InfluencersListDataModel> fetchInfluencersList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencersListUrl, true);
      return response = InfluencersListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  
}
