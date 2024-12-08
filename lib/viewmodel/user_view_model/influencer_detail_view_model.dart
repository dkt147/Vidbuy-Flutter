import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/influencer_detail_data_model/influencer_detail_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_add_view_data_model/user_add_view_data_model.dart';
import 'package:vidbuy_app/repo/influencer_detail_repo.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';

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
    setInfluencerDetailList(ApiResponse.loading());
    _influencerDetailRepo.fetchinfluencerDetail(influencerId).then((value) {
      setInfluencerDetailList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerDetailList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<UserAddViewDataModel> _influencerView = ApiResponse.loading();
  ApiResponse<UserAddViewDataModel> get influencerView => _influencerView;

  setInfluencerView(ApiResponse<UserAddViewDataModel> response) {
    _influencerView = response;
    _influencerView.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerView(
      BuildContext context, String influencerId) async {
    Map<String, dynamic> viewData = {
      "user_id": LocalData.id.toString(),
      "influencer_id": influencerId.toString()
    };

// Parsing the values to int
    viewData = {
      "user_id": int.parse(viewData["user_id"]),
      "influencer_id": int.parse(viewData["influencer_id"]),
    };

    setInfluencerView(ApiResponse.loading());
    _influencerDetailRepo.fetchInfluencerView(viewData).then((value) async {
      if (value.Isbool!) {
        setInfluencerView(ApiResponse.completed(value));
        print("<<<<<<<<<<<<<<<<<<<<<<<<<<View Added>>>>>>>>>>>>>>>>>>");
      } else {}
    }).onError((error, stackTrace) {
      Utils.snackBar(error.toString(), context);
    });
  }

  // Future<void> fetchinfluencerView(String influencerId) async {
  //   setInfluencerView(ApiResponse.loading());
  //   _influencerDetailRepo.fetchinfluencerDetail(influencerId).then((value) {
  //     setInfluencerView(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerView(ApiResponse.error(error.toString()));
  //   });
  // }
}
