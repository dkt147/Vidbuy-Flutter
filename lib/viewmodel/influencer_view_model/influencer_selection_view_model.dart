import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_review_data_model/influencer_review_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_video_type_data_model/influencer_video_type_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/price_range_data_model/price_range_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_category_data_model/set_category_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_price_data_model/set_price_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_price_range_data_model/set_price_range_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_video_type_data_model/set_video_type_data_model.dart';
import 'package:vidbuy_app/repo/influencer_selection_repo.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/otp_scren.dart';

class InfluencerSelectionViewModel with ChangeNotifier {
  InfluencerSelectionRepo _influencerSelectionRepo = InfluencerSelectionRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  List<Map<String, dynamic>> categories =
      []; // List to hold category ID and name
  Map<String, dynamic>? selectedCategory;

  void selectCategory(Map<String, dynamic> category) {
    selectedCategory = category; // Store selected category with ID and name
    notifyListeners(); // Notify listeners about the change
  }

  ApiResponse<SetCategoryDataModel> _setCategoryList = ApiResponse.loading();
  ApiResponse<SetCategoryDataModel> get setCategoryList => _setCategoryList;

  setInfluencersCategoryList(ApiResponse<SetCategoryDataModel> response) {
    _setCategoryList = response;
    _setCategoryList.toString();
    notifyListeners();
  }

  bool _categoryLoading = false;
  bool get categoryLoading => _categoryLoading;

  setCategoryLoading(bool value) {
    _loading = value;
    print(_loading);
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

  Future<void> fetchInfluencerCategoryList() async {
    setCategoryLoading(true);
    setInfluencerCategoryList(ApiResponse.loading());
    _influencerSelectionRepo.fetchInfluencerCategoryList().then((value) {
      print(LocalData.token);
      setInfluencerCategoryList(ApiResponse.completed(value));
      setCategoryLoading(false);
      categories = List<Map<String, dynamic>>.from(
          value.result!.categorylist!.map((item) => {
                'id': item.id,
                'name': item.name,
              }));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerCategoryList(ApiResponse.error(error.toString()));
    });
  }

  List<Map<String, dynamic>> videoTypes = [];

  // Map<String, dynamic>? selectedVideoType;

  List<Map<String, dynamic>> selectedVideoTypes = [];

// List to store only the selected video type IDs
  List<int> selectedVideoTypeIds = [];

// Method to toggle selection for a video type
  void selectVideoType(Map<String, dynamic> videoType) {
    int videoTypeId = videoType['id'];

    // Check if the video type is already selected
    if (selectedVideoTypeIds.contains(videoTypeId)) {
      // Remove from both lists if already selected
      selectedVideoTypeIds.remove(videoTypeId);
      selectedVideoTypes
          .removeWhere((selected) => selected['id'] == videoTypeId);
    } else {
      // Add to both lists if not already selected
      selectedVideoTypeIds.add(videoTypeId);
      selectedVideoTypes.add(videoType);
    }

    notifyListeners(); // Update UI if using Provider or similar state management
  }

  bool _videoTypeLoading = false;
  bool get videoTypeLoading => _videoTypeLoading;

  setVideoTypeLoading(bool value) {
    _videoTypeLoading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<InfluencerVideoTypeDataModel> _influencerVideoTypeList =
      ApiResponse.loading();
  ApiResponse<InfluencerVideoTypeDataModel> get influencerVideoTypeList =>
      _influencerVideoTypeList;

  setInfluencerVideoTypeList(
      ApiResponse<InfluencerVideoTypeDataModel> response) {
    _influencerVideoTypeList = response;
    _influencerVideoTypeList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerVideoTypeList() async {
    setVideoTypeLoading(true);
    setInfluencerVideoTypeList(ApiResponse.loading());
    _influencerSelectionRepo.fetchInfluencerVideoTypeList().then((value) {
      print(LocalData.token);
      setInfluencerVideoTypeList(ApiResponse.completed(value));
      setVideoTypeLoading(false);
      videoTypes = List<Map<String, dynamic>>.from(value.data!.map((item) => {
            'id': item.id,
            'name': item.name,
          }));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerVideoTypeList(ApiResponse.error(error.toString()));
    });
  }

  List<Map<String, dynamic>> priceRanges = [];

  Map<String, dynamic>? selectedPriceRange;

  void selectPriceRange(Map<String, dynamic> priceRange) {
    selectedPriceRange = priceRange; // Store selected category with ID and name
    notifyListeners(); // Notify listeners about the change
  }

  bool _priceRangeLoading = false;
  bool get priceRangeLoading => _priceRangeLoading;

  setpriceRangeLoading(bool value) {
    _priceRangeLoading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<PriceRangeDataModel> _influencerPriceRangeList =
      ApiResponse.loading();
  ApiResponse<PriceRangeDataModel> get influencerPriceRangeList =>
      _influencerPriceRangeList;

  setInfluencerPriceRangeList(ApiResponse<PriceRangeDataModel> response) {
    _influencerPriceRangeList = response;
    _influencerPriceRangeList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerPriceRangeList() async {
    setpriceRangeLoading(true);
    setInfluencerPriceRangeList(ApiResponse.loading());
    _influencerSelectionRepo.fetchInfluencerPriceRangeList().then((value) {
      print(LocalData.token);
      setInfluencerPriceRangeList(ApiResponse.completed(value));
      setpriceRangeLoading(false);
      priceRanges =
          List<Map<String, dynamic>>.from(value.result!.map((item) => {
                'id': item.id,
                'name': item.priceRange,
              }));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerVideoTypeList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchInfluencerCategoryData(BuildContext context,
      {required String category,
      required int categoryId,
      required VoidCallback func}) async {
    if (_validateFields(context, category)) {
      // Return early if validation fails

      Map<String, dynamic> categoryData = {
        'category_id': categoryId,
      };

      setLoading(true);
      setInfluencersCategoryList(ApiResponse.loading());
      _influencerSelectionRepo
          .fetchAddCategoryResponse(categoryData)
          .then((value) async {
        setInfluencersCategoryList(ApiResponse.completed(value));
        setLoading(false);
        func.call();
        Utils.snackBar(value.message.toString(), context);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.snackBar(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      });
    }
  }

  bool _validateFields(BuildContext context, String category) {
    if (category.isEmpty) {
      Utils.snackBar('Please select a category!', context);
      return false;
    }
    return true;
  }

  bool _priceTypeLoading = false;
  bool get priceTypeLoading => _priceTypeLoading;

  setpriceTypeLoading(bool value) {
    _priceTypeLoading = value;
    notifyListeners();
  }

  ApiResponse<SetPriceRangeDataModel> _influencerPriceRangeData =
      ApiResponse.loading();
  ApiResponse<SetPriceRangeDataModel> get influencerPriceRangeData =>
      _influencerPriceRangeData;

  setInfluencerPriceRangeData(ApiResponse<SetPriceRangeDataModel> response) {
    _influencerPriceRangeData = response;
    _influencerPriceRangeData.toString();
    notifyListeners();
  }

  ApiResponse<SetVideoTypeDataModel> _influencerVideoTypeData =
      ApiResponse.loading();
  ApiResponse<SetVideoTypeDataModel> get influencerVideoTypeData =>
      _influencerVideoTypeData;

  setInfluencerVideoTypeData(ApiResponse<SetVideoTypeDataModel> response) {
    _influencerVideoTypeData = response;
    _influencerVideoTypeData.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerData(BuildContext context,
      {required int priceRangeId,
      required List<int> videoTypes,
      required VoidCallback func}) async {
    // Prepare data for both API calls
    Map<String, dynamic> priceRangeData = {
      'price_range_id': priceRangeId,
    };

    Map<String, dynamic> videoTypeData = {
      'video_types': videoTypes,
    };

    // Set loading state
    setpriceTypeLoading(true);
    setInfluencerPriceRangeData(ApiResponse.loading());
    setInfluencerVideoTypeData(ApiResponse.loading());

    try {
      // Fetch both responses
      final priceRangeResponse = await _influencerSelectionRepo
          .fetchAddPriceRangeResponse(priceRangeData);
      final videoTypeResponse = await _influencerSelectionRepo
          .fetchAddVideoTypeResponse(videoTypeData);

      // Handle successful responses
      setInfluencerPriceRangeData(ApiResponse.completed(priceRangeResponse));
      setInfluencerVideoTypeData(ApiResponse.completed(videoTypeResponse));

      // Call the provided function
      func.call();

      // Show success messages
      Utils.snackBar("Video Type and Price Range Added Successfully!", context);
    } catch (error) {
      // Handle errors
      setpriceTypeLoading(false);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    } finally {
      // Ensure loading state is set to false after completing the requests
      setpriceTypeLoading(false);
    }
  }

  ApiResponse<SetPriceDataModel> _influencerPriceData = ApiResponse.loading();
  ApiResponse<SetPriceDataModel> get influencerPriceData =>
      _influencerPriceData;

  setInfluencerPriceData(ApiResponse<SetPriceDataModel> response) {
    _influencerPriceData = response;
    _influencerPriceData.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerPriceData(BuildContext context,
      {required String price, required String id}) async {
    Map<String, dynamic> priceData = {
      'price': price,
    };
    setInfluencerPriceData(ApiResponse.loading());
    _influencerSelectionRepo
        .fetchAddPriceResponse(priceData, id)
        .then((value) async {
      setInfluencerPriceData(ApiResponse.completed(value));
      Utils.snackBar(value.message.toString(), context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  bool _ReviewLoading = false;
  bool get ReviewLoading => _ReviewLoading;

  setReviewLoading(bool value) {
    _ReviewLoading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<InfluencerReviewDataModel> _influencerReviewList =
      ApiResponse.loading();
  ApiResponse<InfluencerReviewDataModel> get influencerReviewList =>
      _influencerReviewList;

  setInfluencerReviewList(ApiResponse<InfluencerReviewDataModel> response) {
    _influencerReviewList = response;
    _influencerReviewList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerReviewList() async {
    setReviewLoading(true);
    setInfluencerReviewList(ApiResponse.loading());
    _influencerSelectionRepo.fetchInfluencerReviewList().then((value) {
      print(LocalData.token);
      setInfluencerReviewList(ApiResponse.completed(value));
      setReviewLoading(false);
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerReviewList(ApiResponse.error(error.toString()));
    });
  }
}
