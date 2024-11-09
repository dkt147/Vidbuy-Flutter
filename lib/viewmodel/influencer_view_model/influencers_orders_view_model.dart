import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/influencer_all_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_pending_orders_data_model/influencer_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_waiting_video_list_data_model/influencer_waiting_video_list_data_model.dart';
import 'package:vidbuy_app/repo/influencer_orders_repo.dart';

class InfluencerOrdersViewModel with ChangeNotifier {
  InfleuncersOrderRepo _influencersOrderRepo = InfleuncersOrderRepo();

  ApiResponse<InfluencerAllOrdersDataModel> _influencerAllOrdersList =
      ApiResponse.loading();
  ApiResponse<InfluencerAllOrdersDataModel> get influencerAllOrdersList =>
      _influencerAllOrdersList;

  setInfluencerAllOrdersList(
      ApiResponse<InfluencerAllOrdersDataModel> response) {
    _influencerAllOrdersList = response;
    _influencerAllOrdersList.toString();
    notifyListeners();
  }

  bool _influencerAllOrdersListLoading = false;
  bool get influencerAllOrdersListLoading => _influencerAllOrdersListLoading;

  setInfluencerAllOrdersListLoading(bool value) {
    _influencerAllOrdersListLoading = value;
    print(_influencerAllOrdersListLoading);
    notifyListeners();
  }

  Future<void> fetchInfluencerAllOrdersList() async {
    setInfluencerAllOrdersListLoading(true);
    setInfluencerAllOrdersList(ApiResponse.loading());
    _influencersOrderRepo.fetchInfluencersAllOrdersList().then((value) {
      setInfluencerAllOrdersList(ApiResponse.completed(value));
      setInfluencerAllOrdersListLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerAllOrdersList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<InfluencerPendingOrdersDataModel> _influencerPendingOrdersList =
      ApiResponse.loading();
  ApiResponse<InfluencerPendingOrdersDataModel>
      get influencerPendingOrdersList => _influencerPendingOrdersList;

  setInfluencerPendingOrdersList(
      ApiResponse<InfluencerPendingOrdersDataModel> response) {
    _influencerPendingOrdersList = response;
    _influencerPendingOrdersList.toString();
    notifyListeners();
  }

  bool _influencerPendingOrdersListLoading = false;
  bool get influencerPendingOrdersListLoading =>
      _influencerPendingOrdersListLoading;

  setInfluencerPendingOrdersListLoading(bool value) {
    _influencerPendingOrdersListLoading = value;
    print(_influencerPendingOrdersListLoading);
    notifyListeners();
  }

  Future<void> fetchInfluencerPendingOrdersList() async {
    setInfluencerPendingOrdersListLoading(true);
    setInfluencerPendingOrdersList(ApiResponse.loading());
    _influencersOrderRepo.fetchInfluencerPendingOrdersList().then((value) {
      setInfluencerPendingOrdersList(ApiResponse.completed(value));
      setInfluencerPendingOrdersListLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerPendingOrdersList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<InfluencerWaitingVideoListDataModel> _influencerWaitingVideoList =
      ApiResponse.loading();
  ApiResponse<InfluencerWaitingVideoListDataModel>
      get influencerWaitingVideoList => _influencerWaitingVideoList;

  setInfluencerWaitingVideoList(
      ApiResponse<InfluencerWaitingVideoListDataModel> response) {
    _influencerWaitingVideoList = response;
    _influencerWaitingVideoList.toString();
    notifyListeners();
  }

  bool _influencerWaitingVideoListLoading = false;
  bool get influencerWaitingVideoListLoading =>
      _influencerWaitingVideoListLoading;

  setInfluencerWaitingVideoListLoading(bool value) {
    _influencerWaitingVideoListLoading = value;
    print(_influencerWaitingVideoListLoading);
    notifyListeners();
  }

  Future<void> fetchInfluencerWaitingVideoList() async {
    setInfluencerWaitingVideoListLoading(true);
    setInfluencerWaitingVideoList(ApiResponse.loading());
    _influencersOrderRepo.fetchInfluencersWaitingVideoList().then((value) {
      setInfluencerWaitingVideoList(ApiResponse.completed(value));
      setInfluencerWaitingVideoListLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerWaitingVideoList(ApiResponse.error(error.toString()));
    });
  }
}
