import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/user_model/trending_influencers_data_model/trending_influencers_data_model.dart';
import 'package:vidbuy_app/repo/user_home_repo.dart';

class HomeScreenViewModel with ChangeNotifier {
  UserHomeRepo _userHomeRepo = UserHomeRepo();

  List<Map<String, dynamic>> categories = [];

  bool _categoryLoading = false;
  bool get categoryLoading => _categoryLoading;

  setCategoryLoading(bool value) {
    _categoryLoading = value;
    print(_categoryLoading);
    notifyListeners();
  }

  ApiResponse<InfluencerCategoryDataModel> _influencerCategoryList =
      ApiResponse.loading();
  ApiResponse<InfluencerCategoryDataModel> get influencerCategoryList =>
      _influencerCategoryList;

  setInfluencerCategoryList(ApiResponse<InfluencerCategoryDataModel> response) {
    _influencerCategoryList = response;
    _influencerCategoryList.toString();
    notifyListeners();
  }

  Future<void> fetchCategoryList() async {
    setCategoryLoading(true);
    setInfluencerCategoryList(ApiResponse.loading());
    _userHomeRepo.fetchCategoryList().then((value) {
      setInfluencerCategoryList(ApiResponse.completed(value));
      setCategoryLoading(false);
      categories = List<Map<String, dynamic>>.from(value.result!.categorylist!
          .map((item) =>
              {'id': item.id, 'name': item.name, 'image': item.image}));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerCategoryList(ApiResponse.error(error.toString()));
    });
  }



  List<Map<String, dynamic>> trendingInfluencers = [];

  bool _trendingInfluencersLoading = false;
  bool get trendingInfluencersLoading => _trendingInfluencersLoading;

  setTrendingInfluencersLoading(bool value) {
    _trendingInfluencersLoading = value;
    print(_trendingInfluencersLoading);
    notifyListeners();
  }

  ApiResponse<TrendingInfluencersDataModel> _trendingInfluencerList =
      ApiResponse.loading();
  ApiResponse<TrendingInfluencersDataModel> get trendingInfluencerList =>
      _trendingInfluencerList;

  setTrendingInfluencerList(ApiResponse<TrendingInfluencersDataModel> response) {
    _trendingInfluencerList = response;
    _trendingInfluencerList.toString();
    notifyListeners();
  }

  Future<void> fetchTrendingInfluencerList() async {
    setCategoryLoading(true);
    setTrendingInfluencerList(ApiResponse.loading());
    _userHomeRepo.fetchTrendingInfluencersList().then((value) {
      setTrendingInfluencerList(ApiResponse.completed(value));
      setCategoryLoading(false);
      categories = List<Map<String, dynamic>>.from(value.result!.topUsers!
          .map((item) =>
              {'id': item.id, 'name': item.name, 'image': item.image}));
      print(value);
    }).onError((error, stackTrace) {
      setTrendingInfluencerList(ApiResponse.error(error.toString()));
    });
  }
}
