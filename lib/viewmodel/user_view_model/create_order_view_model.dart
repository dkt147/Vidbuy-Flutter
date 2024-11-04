import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/influencer_video_type_data_model/influencer_video_type_data_model.dart';
import 'package:vidbuy_app/repo/create_order_user_repo.dart';

class CreateOrderViewModel extends ChangeNotifier {
  UserCreateOrderRepo _userCreateOrderRepo = UserCreateOrderRepo();

  // bool _videoTypeLoading = false;
  // bool get videoTypeLoading => _videoTypeLoading;

  // void setVideoTypeLoading(bool value) {
  //   _videoTypeLoading = value;
  //   notifyListeners();
  // }

  // String _videoType = "Select videoType";
  // String get videoType => _videoType;

  // void setVideoType(String value) {
  //   _videoType = value;
  //   notifyListeners();
  // }

  ApiResponse<InfluencerVideoTypeDataModel> _influencerVideoTypeList =
      ApiResponse.loading();
  ApiResponse<InfluencerVideoTypeDataModel> get influencerVideoTypeList =>
      _influencerVideoTypeList;

  void setInfluencerVideoTypeList(
      ApiResponse<InfluencerVideoTypeDataModel> response) {
    _influencerVideoTypeList = response;
    notifyListeners();
  }

  List<Map<String, dynamic>> videoTypes = [];

  Map<String, dynamic>? selectedPriceRange;

  void selectPriceRange(Map<String, dynamic> priceRange) {
    selectedPriceRange = priceRange; // Store selected category with ID and name
    notifyListeners(); // Notify listeners about the change
  }

  Map<String, dynamic>? selectedVideoType;

  void setSelectedVideoType(Map<String, dynamic> videoType) {
    selectedVideoType = videoType;
    notifyListeners(); // Notify listeners to update UI
  }




    Map<String, dynamic>? selectedVideoTypeDetails;

  void setVideoType(String id, String name, String price) {
    selectedVideoTypeDetails = {'id': id, 'name': name, 'price': price};
    notifyListeners();
  }

  Future<void> fetchVideoTypeList(String influencerId) async {
  setInfluencerVideoTypeList(ApiResponse.loading());
  
  _userCreateOrderRepo.fetchInfluencerVideoType(influencerId).then((value) {
    if (value.result != null && value.result!.isNotEmpty) {
      // Populate the list if result is non-null and contains items
      setInfluencerVideoTypeList(ApiResponse.completed(value));
      videoTypes = List<Map<String, dynamic>>.from(value.result!.map((item) => {
            'id': item.id,
            'name': item.name,
            'price': item.price
          }));
      print("Video type list fetched successfully.");
    } else {
      // Handle case where result is empty or null
      setInfluencerVideoTypeList(ApiResponse.error("No video types available."));
      print("No video types available.");
    }
  }).onError((error, stackTrace) {
    setInfluencerVideoTypeList(ApiResponse.error(error.toString()));
    print("Error fetching video types: $error");
  });
}

 // This is just a placeholder for your actual fetch method
//   Future<void> fetchVideoTypeList() async {
//     // Example data fetch; replace with your API call
//     videoTypes = [
//       {'id': '4', 'name': 'Special Day', 'price': '400'},
//       {'id': '5', 'name': 'Questions', 'price': '500'},
//     ];
//     notifyListeners();
//   }
// }


  // Future<void> fetchInfluencerSignupData(BuildContext context,
  //     {required String name,
  //     required String username,
  //     required String email,
  //     required String password,
  //     required String country,
  //     required String? base64Image,
  //     required String? base64Video}) async {
  //   if (_validateFields(
  //       context, name, username, email, password, base64Image, base64Video)) {
  //     // Return early if validation fails

  //     Map<String, dynamic> registrationData = {
  //       'name': name,
  //       'username': username,
  //       'email': email,
  //       'password': password,
  //       'country_id': '5',
  //       // 'profile_image': base64Image,
  //       'role_id': '3',
  //     };

  //     setLoading(true);
  //     setInfluencerSignupData(ApiResponse.loading());
  //     _signupRepo
  //         .fetchGenericSignupResponse(registrationData)
  //         .then((value) async {
  //       setInfluencerSignupData(ApiResponse.completed(value));

  //       // Check if value.result is a Map and access code properly
  //       if (value.result is Map<String, dynamic>) {
  //         String verificationCode = value.result['code'].toString();
  //         String token = value.result['token'].toString();
  //         print(token);
  //         await LocalData.setToken(token);
  //         navigate(context, OtpScren(code: verificationCode, token: token));
  //       }
  //       // else {
  //       //   // Handle unexpected result structure
  //       //   Utils.snackBar("Unexpected response structure.", context);
  //       // }

  //       setLoading(false);
  //       Utils.snackBar(value.message.toString(), context);

  //       if (kDebugMode) {
  //         print(value.toString());
  //       }
  //     }).onError((error, stackTrace) {
  //       setLoading(false);
  //       Utils.snackBar(error.toString(), context);
  //       if (kDebugMode) {
  //         print(error.toString());
  //       }
  //     });
  //   }
  // }

  // Future<bool> fetchInfluencerSignupData(
  //   BuildContext context, {
  //   required String name,
  //   required String username,
  //   required String email,
  //   required String password,
  //   required String country,
  //   required String? base64Image,
  // }) async {
  //   if (_validateFields(context, name, username, email, password, base64Image)) {

  //   }

  //   setLoading(true);

  //   // Prepare the registration data
  //   Map registrationData = {
  //     'name': name,
  //     'username': username,
  //     'email': email,
  //     'password': password,
  //     'country': "1",
  //     'profile_image': base64Image,
  //     'role_id': "3",
  //   };

  //   _signupRepo.fetchGenericSignupResponse(registrationData).then((value) async {
  //     print(value);
  //     setLoading(false);

  //     Utils.snackBar(value.message.toString(), context);

  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     Utils.snackBar(error.toString(), context);
  //   });

  // }

  // bool _validateFields(
  //     BuildContext context,
  //     String name,
  //     String username,
  //     String email,
  //     String password,
  //     String? base64Image,
  //     String? videoBase64Image) {
  //   if (name.isEmpty) {
  //     Utils.snackBar('Please enter your name', context);
  //     return false;
  //   }
  //   if (username.isEmpty) {
  //     Utils.snackBar('Please enter your username', context);
  //     return false;
  //   }
  //   if (email.isEmpty || !_isValidEmail(email)) {
  //     Utils.snackBar('Please enter a valid email', context);
  //     return false;
  //   }
  //   if (password.isEmpty || password.length < 8) {
  //     Utils.snackBar('Password must be at least 8 characters long', context);
  //     return false;
  //   }
  //   if (base64Image == null) {
  //     Utils.snackBar('Please select a profile image', context);
  //     return false;
  //   }
  //   if (videoBase64Image == null) {
  //     Utils.snackBar('Please select a intro video', context);
  //     return false;
  //   }
  //   return true;
  // }

  // bool _isValidEmail(String email) {
  //   RegExp emailRegExp = RegExp(
  //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  //   );
  //   return emailRegExp.hasMatch(email);
  // }
}
