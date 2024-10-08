import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService();

  // Method to set data in SharedPreferences
  Future<bool> set(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, data);
  }

  // Method to get data from SharedPreferences
  Future<String?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
