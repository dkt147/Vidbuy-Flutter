import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/influencers_list_data_model/influencers_list_data_model.dart';
import 'package:vidbuy_app/repo/user_search_repo.dart';

class SearchScreenViewModel with ChangeNotifier {
  UserSearchRepo _userSearchRepo = UserSearchRepo();

  // List<Map<String, dynamic>> categories = [];

  bool _influencerLoading = false;
  bool get influencerLoading => _influencerLoading;

  setInfluencerLoading(bool value) {
    _influencerLoading = value;
    print(_influencerLoading);
    notifyListeners();
  }

  ApiResponse<InfluencersListDataModel> _influencersList =
      ApiResponse.loading();
  ApiResponse<InfluencersListDataModel> get influencersList =>
      _influencersList;

  setInfluencersList(ApiResponse<InfluencersListDataModel> response) {
    _influencersList = response;
    _influencersList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerList() async {
    setInfluencerLoading(true);
    setInfluencersList(ApiResponse.loading());
    _userSearchRepo.fetchInfluencersList().then((value) {
      setInfluencersList(ApiResponse.completed(value));
      setInfluencerLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencersList(ApiResponse.error(error.toString()));
    });
  }


}