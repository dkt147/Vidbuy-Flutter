import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/influencer_detail_data_model/influencer_detail_data_model.dart';
import 'package:vidbuy_app/repo/influencer_detail_repo.dart';

class InfluencerDetailViewModel with ChangeNotifier {
  InfluencerDetailRepo _influencerDetailRepo = InfluencerDetailRepo();

  ApiResponse<InfluencerDetailDataModel> _influencerDetailList =
      ApiResponse.loading();
  ApiResponse<InfluencerDetailDataModel> get influencerDetailList =>
      _influencerDetailList;

  setInfluencerDetailList(ApiResponse<InfluencerDetailDataModel> response) {
    _influencerDetailList = response;
    _influencerDetailList.toString();
    notifyListeners();
  }

  bool _influencerListLoading = false;
  bool get influencerListLoading => _influencerListLoading;

  setInfluencerListLoading(bool value) {
    _influencerListLoading = value;
    print(_influencerListLoading);
    notifyListeners();
  }

  Future<void> fetchinfluencerDetailList(String influencerId) async {
    setInfluencerListLoading(true);
    setInfluencerDetailList(ApiResponse.loading());
    _influencerDetailRepo.fetchinfluencerDetail(influencerId).then((value) {
      setInfluencerDetailList(ApiResponse.completed(value));
      setInfluencerListLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerDetailList(ApiResponse.error(error.toString()));
    });
  }
}
