import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_search_data_model/user_search_data_model.dart';
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

  ApiResponse<UserSearchDataModel> _influencersList = ApiResponse.loading();
  ApiResponse<UserSearchDataModel> get influencersList => _influencersList;

  setInfluencersList(ApiResponse<UserSearchDataModel> response) {
    _influencersList = response;
    _influencersList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerList(
      {String? categoryId,
      String? search,
      String? sortBy,
      double? maxPrice}) async {
    if (maxPrice == 0) {
      maxPrice = null;
    }

    Map<String, dynamic> searchData = {
      'search': search!.isEmpty ? null : search,
      // //    "page": 3,
      "category_id": categoryId!.isEmpty ? null : categoryId,
      // // //  "per_page": 6
      "max_price": maxPrice,
      "sort_by": sortBy
    };
    setInfluencerLoading(true);
    setInfluencersList(ApiResponse.loading());
    _userSearchRepo.fetchInfluencerByCategory(searchData).then((value) {
      setInfluencersList(ApiResponse.completed(value));
      setInfluencerLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencersList(ApiResponse.error(error.toString()));
    });
  }

  Timer? _debounce;
  void onSearchTextChanged(String searchQuery) {
    // Cancel the previous debounce timer if still active
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Set up a new timer
    _debounce = Timer(Duration(milliseconds: 500), () {
      fetchInfluencerList(search: searchQuery); // Trigger search with new input
    });
  }
}
