import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/main.dart';

class LocalData {
  static String _lid = "";
  static String get id => _lid;

  static String _lroleId = "";
  static String get roleId => _lroleId;

  static String _lname = "";
  static String get name => _lname;

  static String _lusername = "";
  static String get username => _lusername;

  static String _lcountryId = "";
  static String get countryId => _lcountryId;

  static String _lcountryName = "";
  static String get countryName => _lcountryName;

  static String _lemail = "";
  static String get email => _lemail;

  static String _limage = "";
  static String get image => _limage;

  static String _lstatus = "";
  static String get status => _lstatus;

  static String _lfirebaseToken = "";
  static String get firebaseToken => _lfirebaseToken;

  static String _lisProfileCompleted = "";
  static String get isProfileCompleted => _lisProfileCompleted;

  static String _ltoken = "";
  static String get token => _ltoken;

  static const String _ktoken = "ktoken";

  // Function to set token and save it locally
  static Future<void> setToken(String token) async {
    _ltoken = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_ktoken, token);
  }

  // Function to load token from shared preferences
  static Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _ltoken = prefs.getString(_ktoken) ?? "";
  }

  static setlValues(
    String id,
    String roleId,
    String name,
    String username,
    String countryId,
    String countryName,
    String email,
    String image,
    String status,
    String isProfileCompleted,
    // String token,
  ) {
    _lid = id;
    _lroleId = roleId;
    _lname = name;
    _lusername = username;
    _lcountryId = countryId;
    _lcountryName = countryName;
    _lemail = email;
    _limage = image;
    _lstatus = status;
    _lisProfileCompleted = isProfileCompleted;
    // _ltoken = token;
  }

  String _kid = "kid";
  String _kroleId = "kroleId";
  String _kname = "kname";
  String _kusername = "kusername";
  String _kcountryId = "kcountryId";
  String _kcountryName = "kcountryName";
  String _kemail = "kemail";
  String _kimage = "kimage";
  String _kstatus = "kstatus";
  String _kisProfileCompleted = "kisProfileCompleted";
  // String _ktoken = "ktoken";

// Future<void> saveDataLocally(Data? data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String jsonData = jsonEncode(data);
//   prefs.setString('data', jsonData);
// }

  Future<void> saveTokenLocally(
    String id,
    String roleId,
    String name,
    String username,
    String countryId,
    String countryName,
    String email,
    String image,
    String status,
    String isProfileCompleted,
    // String token
  ) async {
    _lid = id;
    _lroleId = roleId;
    _lname = name;
    _lusername = username;
    _lcountryId = countryId;
    _lcountryName = countryName;
    _lemail = email;
    _limage = image;
    _lstatus = status;
    _lisProfileCompleted = isProfileCompleted;
    // _ltoken = token;
    pref.setString(_kid, id);
    pref.setString(_kroleId, roleId);
    pref.setString(_kname, name);
    pref.setString(_kusername, username);
    pref.setString(_kcountryId, countryId);
    pref.setString(_kcountryName, countryName);
    pref.setString(_kemail, email);
    pref.setString(_kimage, image);
    pref.setString(_kstatus, status);
    pref.setString(_kisProfileCompleted, isProfileCompleted);
    // pref.setString(_ktoken, token);
  }

  Future<String?> getTokenLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? i = prefs.getString(_kid);
    String? ri = prefs.getString(_kroleId);
    String? n = prefs.getString(_kname);
    String? un = prefs.getString(_kusername);
    String? ci = prefs.getString(_kcountryId);
    String? cn = prefs.getString(_kcountryName);
    String? e = prefs.getString(_kemail);
    String? im = prefs.getString(_kimage);
    String? s = prefs.getString(_kstatus);
    String? ipc = prefs.getString(_kisProfileCompleted);
    // String? t = prefs.getString(_ktoken);
    setlValues(
      i.toString(),
      ri.toString(),
      n.toString(),
      un.toString(),
      ci.toString(),
      cn.toString(),
      e.toString(),
      im.toString(),
      s.toString(),
      ipc.toString(),
      // t.toString()
    );
  }
}
