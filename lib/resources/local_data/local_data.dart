import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/main.dart';

class LocalData {
  static String _lid = "";
  static String get id => _lid;

  static String _ltoken = "";
  static String get token => _ltoken;

  static String _lname = "";
  static String get name => _lname;

  static String _laddress = "";
  static String get address => _laddress;
  static String _laddressId = "";
  static String get addressId => _laddressId;

  static String _lcnic = "";
  static String get cnic => _lcnic;

  static String _lphone = "";
  static String get phone => _lphone;

  static String _lsociety = "";
  static String get society => _lsociety;

  static String _lsocietyId = "";
  static String get societyId => _lsocietyId;

  static String _lprofile = "";
  static String get profile => _lprofile;

  static String _lqr = "";
  static String get qr => _lqr;

  static bool _logout = true;
  static bool get logout => _logout;

  static setlValues(
      String id,
      String token,
      String name,
      String address,
      String addressId,
      String cnic,
      String phone,
      String society,
      String societyId,
      String profile,
      String qr,
      bool logout) {
    _lid = id;
    _ltoken = token;
    _lname = name;
    _laddress = address;
    _laddressId = addressId;
    _lcnic = cnic;
    _lphone = phone;
    _lsociety = society;
    _lsocietyId = societyId;
    _lprofile = profile;
    _lqr = qr;
    _logout = logout;
  }

  String _kid = "kid";
  String _token = 'token';
  String _name = 'name';
  String _address = 'address';
  String _addressId = 'kaddressId';
  String _cnic = "kcnic";
  String _kphone = "kphone";
  String _ksociety = "ksociety";
  String _ksocietyId = "ksocietyId";
  String _kprofile = "kprofile";
  String _kqr = 'kqr';
  String _klogout = 'klo';

// Future<void> saveDataLocally(Data? data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String jsonData = jsonEncode(data);
//   prefs.setString('data', jsonData);
// }

  Future<void> saveTokenLocally(
      String id,
      String token,
      String name,
      String address,
      String addressId,
      String cnic,
      String phone,
      String society,
      String societyId,
      String profile,
      String qr,
      bool logout) async {
    _lid = id;
    _ltoken = token;
    _lname = name;
    _laddress = address;
    _laddressId = addressId;
    _lcnic = cnic;
    _lphone = phone;
    _lsociety = society;
    _lsocietyId = societyId;
    _lprofile = profile;
    _lqr = qr;
    _logout = logout;
    pref.setString(_kid, id);
    pref.setString(_token, token);
    pref.setString(_name, name);
    pref.setString(_address, address);
    pref.setString(_addressId, addressId);
    pref.setString(_cnic, cnic);
    pref.setString(_kphone, phone);
    pref.setString(_ksociety, society);
    pref.setString(_ksocietyId, societyId);
    pref.setString(_kprofile, profile);
    pref.setString(_kqr, qr);
    pref.setBool(_klogout, logout);
  }

  Future<void> saveContactLocally(String phone) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    pref.setString(_kphone, phone);
  }

  Future<void> saveProfile(String profile) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    pref.setString(_kprofile, profile);
  }

  Future<void> saveSessionLocally(bool logout) async {
    pref.setBool(_klogout, logout);
  }

  Future<String?> getTokenLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? i = prefs.getString(_kid);
    String? t = prefs.getString(_token);
    String? n = prefs.getString(_name);
    String? a = prefs.getString(_address);
    String? ai = prefs.getString(_addressId);
    String? c = prefs.getString(_cnic);
    String? p = prefs.getString(_kphone);
    String? s = prefs.getString(_ksociety);
    String? si = prefs.getString(_ksocietyId);
    String? pr = prefs.getString(_kprofile);
    String? q = prefs.getString(_kqr);
    bool? l = prefs.getBool(_klogout);
    setlValues(
        i.toString(),
        t.toString(),
        n.toString(),
        a.toString(),
        ai.toString(),
        c.toString(),
        p.toString(),
        s.toString(),
        si.toString(),
        pr.toString(),
        q.toString(),
        l ?? true);
  }
}
