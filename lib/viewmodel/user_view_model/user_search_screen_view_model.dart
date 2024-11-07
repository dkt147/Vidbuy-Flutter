import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/user_model/influencer_list_by_category_data_model/influencer_list_by_category_data_model.dart';
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

  List<Map<String, String?>> _categories = [];
  List<Map<String, String?>> get categories => _categories;

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
    _userSearchRepo.fetchCategoryList().then((value) {
      setInfluencerCategoryList(ApiResponse.completed(value));
      setCategoryLoading(false);
      _categories = value.result!.categorylist!
          .map((item) => {
                "id": item.id.toString(),
                "title": item.name.toString(),
                "subtitle": item.tagLine.toString(),
                "image": item.image.toString(), // Fallback image
              })
          .toList();
      print(value);
    }).onError((error, stackTrace) {
      setCategoryLoading(false);
      setInfluencerCategoryList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<InfluencerListByCategoryDataModel> _influencersList =
      ApiResponse.loading();
  ApiResponse<InfluencerListByCategoryDataModel> get influencersList =>
      _influencersList;

  setInfluencersList(ApiResponse<InfluencerListByCategoryDataModel> response) {
    _influencersList = response;
    _influencersList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerList(String categoryId) async {
    setInfluencerLoading(true);
    setInfluencersList(ApiResponse.loading());
    _userSearchRepo.fetchInfluencerByCategory(categoryId).then((value) {
      setInfluencersList(ApiResponse.completed(value));
      setInfluencerLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencersList(ApiResponse.error(error.toString()));
    });
  }
}
