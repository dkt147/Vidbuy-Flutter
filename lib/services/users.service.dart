import 'dart:convert'; // For json decoding
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/services/storage.service.dart';

class UserService {
  final Logger _logger = Logger();
  // Function to get the user's name from SharedPreferences
  Future<String?> getUserName() async {
    StorageService stg = StorageService();

    String? userJson = await stg.get('user');
    _logger.d(userJson);

    // If the user is stored in SharedPreferences, decode and return the name
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return userMap['name']; // Assuming the 'name' key exists in the JSON
    }

    return null; // Return null if no user is stored
  }
}
