import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_category_data_model/set_category_data_model.dart';
import 'package:vidbuy_app/repo/setting_repo.dart';

class SettingViewModel with ChangeNotifier {
  SettingRepo _settingRepo = SettingRepo();

  List<Map<String, dynamic>> categories =
      []; // List to hold category ID and name
  Map<String, dynamic>? selectedCategory;

  void selectCategory(Map<String, dynamic> category) {
    selectedCategory = category; // Store selected category with ID and name
    notifyListeners(); // Notify listeners about the change
  }

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

  ApiResponse<SetCategoryDataModel> _setCategoryList = ApiResponse.loading();
  ApiResponse<SetCategoryDataModel> get setCategoryList => _setCategoryList;

  setInfluencersCategoryList(ApiResponse<SetCategoryDataModel> response) {
    _setCategoryList = response;
    _setCategoryList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerCategoryList() async {
    setCategoryLoading(true);
    setInfluencerCategoryList(ApiResponse.loading());
    _settingRepo.fetchInfluencerCategoryList().then((value) {
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

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  Future<void> fetchInfluencerCategoryData(
    BuildContext context, {
    required String category,
    required int categoryId,
  }) async {
    if (_validateFields(context, category)) {
      // Return early if validation fails

      Map<String, dynamic> categoryData = {
        'category_id': categoryId,
      };

      setLoading(true);
      setInfluencersCategoryList(ApiResponse.loading());
      _settingRepo.fetchAddCategoryResponse(categoryData).then((value) async {
        setInfluencersCategoryList(ApiResponse.completed(value));
        setLoading(false);
        Navigator.pop(context);
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
}
