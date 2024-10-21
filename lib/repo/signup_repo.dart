import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/generic_signup_data_model/generic_signup_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class SignupRepo {
  BaseApiServices apiServices = NetworkApiService();

Future<GenericSignupDataModel> fetchGenericSignupResponse(dynamic data) async {
  try {
dynamic response = await apiServices.getPostApiResponse(AppUrl.genericSignupUrl, data);
print(response); // Print the raw response

    return GenericSignupDataModel.fromJson(response);
  } catch (e) {
    throw Exception("Error fetching signup response: $e");
  }
}



// Future<SocietyDataModel> fetchAdminSignupResponse() async {
//     try {
//       dynamic response = await apiServices.getGetApiResponse(AppUrl.societyUrl);
//       return response = SocietyDataModel.fromJson(response);
//     } catch (e) {
//       throw e;
//     }
//   }

  // Future<UserSignupDataModel> fetchInfluencerSignupResponse(dynamic data) async {
  //   try {
  //     dynamic response =
  //         await apiServices.getPostApiResponse(AppUrl.influencerSignupUrl, data);
  //     return response = UserSignupDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
