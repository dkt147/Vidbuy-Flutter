import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/notification_update_data_model/notification_update_data_model.dart';
import 'package:vidbuy_app/model/user_model/give_away_data_model/give_away_data_model.dart';
import 'package:vidbuy_app/model/user_model/recently_added_data_model/recently_added_data_model.dart';
import 'package:vidbuy_app/model/user_model/trending_influencers_data_model/trending_influencers_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_search_data_model/user_search_data_model.dart';
import 'package:vidbuy_app/repo/user_home_repo.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';

class HomeScreenViewModel with ChangeNotifier {
  UserHomeRepo _userHomeRepo = UserHomeRepo();

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
    _userHomeRepo.fetchCategoryList().then((value) {
      setInfluencerCategoryList(ApiResponse.completed(value));
      setCategoryLoading(false);
      _categories = value.result!.categorylist!
          .map((item) => {
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

  setTrendingInfluencerList(
      ApiResponse<TrendingInfluencersDataModel> response) {
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
      // categories = List<Map<String, dynamic>>.from(value.result!.topUsers!.map(
      //     (item) => {'id': item.id, 'name': item.name, 'image': item.image}));
      print(value);
    }).onError((error, stackTrace) {
      setTrendingInfluencerList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<GiveAwayDataModel> _giveAwayList = ApiResponse.loading();
  ApiResponse<GiveAwayDataModel> get giveAwayList => _giveAwayList;

  setGiveAwayList(ApiResponse<GiveAwayDataModel> response) {
    _giveAwayList = response;
    _giveAwayList.toString();
    notifyListeners();
  }

  bool _giveAwayLoading = false;
  bool get giveAwayLoading => _giveAwayLoading;

  setGiveAwayLoading(bool value) {
    _giveAwayLoading = value;
    print(_giveAwayLoading);
    notifyListeners();
  }

  Future<void> fetchGiveAwayList() async {
    setGiveAwayLoading(true);
    setGiveAwayList(ApiResponse.loading());
    _userHomeRepo.fetchGiveAwayList().then((value) {
      setGiveAwayList(ApiResponse.completed(value));
      setGiveAwayLoading(false);
      // categories = List<Map<String, dynamic>>.from(value.result!.topUsers!.map(
      //     (item) => {'id': item.id, 'name': item.name, 'image': item.image}));
      print(value);
    }).onError((error, stackTrace) {
      setGiveAwayList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<RecentlyAddedDataModel> _recentlyAddedList =
      ApiResponse.loading();
  ApiResponse<RecentlyAddedDataModel> get recentlyAddedList =>
      _recentlyAddedList;

  setRecentlyAddedList(ApiResponse<RecentlyAddedDataModel> response) {
    _recentlyAddedList = response;
    _recentlyAddedList.toString();
    notifyListeners();
  }

  bool _recentlyAddedLoading = false;
  bool get recentlyAddedLoading => _recentlyAddedLoading;

  setRecentlyAddedLoading(bool value) {
    _recentlyAddedLoading = value;
    print(_recentlyAddedLoading);
    notifyListeners();
  }

  Future<void> fetchRecentlyAddedList() async {
    setRecentlyAddedLoading(true);
    setRecentlyAddedList(ApiResponse.loading());
    _userHomeRepo.fetchRecentlyAddedList().then((value) {
      setRecentlyAddedList(ApiResponse.completed(value));
      setRecentlyAddedLoading(false);
      // categories = List<Map<String, dynamic>>.from(value.result!.topUsers!.map(
      //     (item) => {'id': item.id, 'name': item.name, 'image': item.image}));
      print(value);
    }).onError((error, stackTrace) {
      setRecentlyAddedList(ApiResponse.error(error.toString()));
    });
  }

  Timer? _debounce;

  bool _searchInfluencerLoading = false;
  bool get searchInfluencerLoading => _searchInfluencerLoading;

  setSearchInfluencerLoading(bool value) {
    _searchInfluencerLoading = value;
    print(_searchInfluencerLoading);
    notifyListeners();
  }

  ApiResponse<UserSearchDataModel> _searchInfluencerList =
      ApiResponse.loading();
  ApiResponse<UserSearchDataModel> get searchInfluencerList =>
      _searchInfluencerList;

  setSearchInfluencerList(ApiResponse<UserSearchDataModel> response) {
    _searchInfluencerList = response;
    _searchInfluencerList.toString();
    notifyListeners();
  }

  Future<void> fetchSearchInfluencerList(String search) async {
    Map<String, dynamic> searchData = {
      'search': search.isEmpty ? null : search
    };
    setSearchInfluencerLoading(true);
    setSearchInfluencerList(ApiResponse.loading());
    _userHomeRepo.fetchSearchInfluencerList(searchData).then((value) {
      setSearchInfluencerList(ApiResponse.completed(value));
      setSearchInfluencerLoading(false);
      // categories = List<Map<String, dynamic>>.from(value.result!.topUsers!.map(
      //     (item) => {'id': item.id, 'name': item.name, 'image': item.image}));
      print(value);
    }).onError((error, stackTrace) {
      setSearchInfluencerList(ApiResponse.error(error.toString()));
    });
  }

  void onSearchTextChanged(String searchText) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      // After 500 ms, fetch search results
      fetchSearchInfluencerList(searchText);
    });
  }

  ApiResponse<NotificationUpdateDataModel> _notificationResponse =
      ApiResponse.loading();
  ApiResponse<NotificationUpdateDataModel> get notificationResponse =>
      _notificationResponse;

  setNotificationResponse(ApiResponse<NotificationUpdateDataModel> response) {
    _notificationResponse = response;
    _notificationResponse.toString();
    notifyListeners();
  }

  Future<void> fetchNotificationUpdate(String token) async {
    Map<String, dynamic> notificationData = {
      "email": LocalData.email.toString(),
      "token": token
    };
    setNotificationResponse(ApiResponse.loading());
    _userHomeRepo.fetchUserNotifications(notificationData).then((value) {
      setNotificationResponse(ApiResponse.completed(value));
      print(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<Fcm Sent>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(value);
    }).onError((error, stackTrace) {
      setNotificationResponse(ApiResponse.error(error.toString()));
    });
  }
}
