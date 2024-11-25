import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/model/influencer_model/country_list_data_model/country_list_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_category_data_model/influencer_category_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_edit_profile_view_model/influencer_edit_profile_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/set_category_data_model/set_category_data_model.dart';
import 'package:vidbuy_app/repo/setting_repo.dart';
import 'package:vidbuy_app/repo/signup_repo.dart';
import 'package:video_player/video_player.dart';

class SettingViewModel with ChangeNotifier {
  SettingRepo _settingRepo = SettingRepo();
  SignupRepo _signupRepo = SignupRepo();

  File? _profileImage;
  File? get profileImage => _profileImage;

  String? _base64Image;
  String? get base64Image => _base64Image;

  Future<void> pickProfileImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        _profileImage = File(image.path);
        _base64Image = base64Encode(_profileImage!.readAsBytesSync());
        notifyListeners(); // Notify listeners after updating the image
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void clearProfileImage() {
    _profileImage = null;
    notifyListeners();
  }

  void clearIntroVideo() {
    _introVideo = null;
    notifyListeners();
  }

  File? _introVideo;
  File? get introVideo => _introVideo;

  String? _introVideoBase64;
  String? get introVideoBase64 => _introVideoBase64;
  VideoPlayerController? _videoPlayerController;
  VideoPlayerController? get videoPlayerController => _videoPlayerController;

  // Function to pick a video (only .mp4, .mov, .avi)
  Future<void> pickIntroVideo() async {
    // Existing code to pick the video file
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

      if (video != null) {
        final file = File(video.path);
        final extension = file.path.split('.').last.toLowerCase();

        if (['mp4', 'mov', 'avi'].contains(extension)) {
          _introVideo = file;
          _videoPlayerController = VideoPlayerController.file(_introVideo!)
            ..initialize().then((_) {
              notifyListeners();
            });
        } else {
          print(
              'Unsupported video format. Please select an mp4, mov, or avi file.');
        }
      }
    } catch (e) {
      print('Error picking video: $e');
    }
  }

  bool _countryLoading = false;
  bool get countryLoading => _countryLoading;

  setCountryLoading(bool value) {
    _countryLoading = value;
    print(_countryLoading);
    notifyListeners();
  }

  int _currentPage = 1;
  int get currentPage => _currentPage;

  ApiResponse<CountryListDataModel> _countryList =
      ApiResponse.completed(CountryListDataModel());
  ApiResponse<CountryListDataModel> get countryList => _countryList;

  // Set the country list and notify listeners only when the data changes
  setCountryList(ApiResponse<CountryListDataModel> response) {
    if (response != _countryList) {
      _countryList = response;
      notifyListeners();
    }
  }

  // Fetch country list with pagination
  Future<void> fetchCountryList({int page = 1}) async {
    setCountryLoading(true);
    if (_countryList.status == Status.LOADING)
      return; // Prevent refetching if already loading
    setCountryList(ApiResponse.loading());
    try {
      dynamic response = await _signupRepo.fetchCountryList(page: page);
      CountryListDataModel countryData =
          CountryListDataModel.fromJson(response);
      setCountryLoading(false);
      setCountryList(ApiResponse.completed(countryData));
    } catch (e) {
      setCountryLoading(false);
      setCountryList(ApiResponse.error(e.toString()));
    }
  }

  void incrementPage() {
    if (_currentPage < 25) {
      // Ensure the page does not exceed the max number
      _currentPage++;
      fetchCountryList(page: _currentPage); // Fetch new data for next page
    }
  }

  void decrementPage() {
    if (_currentPage > 1) {
      _currentPage--;
      fetchCountryList(page: _currentPage); // Fetch new data for previous page
    }
  }

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

  bool _influencerEditProfileLoading = false;
  bool get influencerEditProfileLoading => _influencerEditProfileLoading;

  setinfluencerEditProfileLoading(bool value) {
    _influencerEditProfileLoading = value;
    print(_influencerEditProfileLoading);
    notifyListeners();
  }

  ApiResponse<InfluencerEditProfileDataModel>
      _influencerinfluencerEditProfileList = ApiResponse.loading();
  ApiResponse<InfluencerEditProfileDataModel>
      get influencerinfluencerEditProfileList =>
          _influencerinfluencerEditProfileList;

  setInfluencerinfluencerEditProfileList(
      ApiResponse<InfluencerEditProfileDataModel> response) {
    _influencerinfluencerEditProfileList = response;
    _influencerinfluencerEditProfileList.toString();
    notifyListeners();
  }

  Future<void> fetchEditProfileResponse(
      BuildContext context,
      String name,
      String username,
      String email,
      String base64Image,
      VoidCallback func) async {
    if (_validateProfileFields(context, name, username, email, base64Image)) {
      Map<String, dynamic> editProfileData = {
        "name": name,
        "username": username,
        "email": email,
        "image": base64Image,
        "country_id": "4"
      };
      setinfluencerEditProfileLoading(true);
      setInfluencerinfluencerEditProfileList(ApiResponse.loading());
      _settingRepo
          .fetchInfluencerEditProfileResponse(editProfileData)
          .then((value) async {
        setInfluencerinfluencerEditProfileList(ApiResponse.completed(value));
        if (value.Isbool!) {
          Utils.snackBar(value.message.toString(), context);
          // navigatePushReplace(context, LoginScreen());
          func.call();
        }
        Utils.snackBar(value.message.toString(), context);
        setinfluencerEditProfileLoading(false);
      }).onError((error, stackTrace) {
        setinfluencerEditProfileLoading(false);
        Utils.snackBar(error.toString(), context);
      });
    }
  }

  bool _validateProfileFields(BuildContext context, String name,
      String username, String email, String base64Image) {
    if (name.isEmpty) {
      Utils.snackBar('Please enter your name', context);
      return false;
    }
    if (username.isEmpty) {
      Utils.snackBar('Please enter your username', context);
      return false;
    }
    if (email.isEmpty || !_isValidEmail(email)) {
      Utils.snackBar('Please enter a valid email', context);
      return false;
    }
    if (base64Image == "null") {
      Utils.snackBar('Please select a profile image', context);
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
