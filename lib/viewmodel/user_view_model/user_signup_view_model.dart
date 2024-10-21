import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/repo/signup_repo.dart';

class CreateUserViewModel with ChangeNotifier {
  SignupRepo _signupRepo = SignupRepo();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  File? _media;
  bool _isImage = true;

  File? get media => _media;
  bool get isImage => _isImage;

  Future<void> pickMedia() async {
    try {
      // Pick image
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (pickedFile == null) {
        // If no image is selected, pick video
        final XFile? pickedVideo =
            await _picker.pickVideo(source: ImageSource.gallery);
        if (pickedVideo != null) {
          _media = File(pickedVideo.path);
          _isImage = false;
        }
      } else {
        _media = File(pickedFile.path);
        _isImage = true;
      }

      notifyListeners();
    } catch (e) {
      print("Error picking media: $e");
    }
  }

  Future<void> fetchCreateUserReponse(
      BuildContext context, dynamic data) async {
    setLoading(true);
    _signupRepo.fetchGenericSignupResponse(data).then((value) async {
      print(value);
      setLoading(false);

      Utils.snackBar(value.message.toString(), context);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
