import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/influencer_navbar_screen.dart';
import 'package:vidbuy_app/view/stripe_connect_account_screen.dart';

class ProofIdentityScreen extends StatefulWidget {
  ProofIdentityScreen({super.key});

  @override
  State<ProofIdentityScreen> createState() => _ProofIdentityScreenState();
}

class _ProofIdentityScreenState extends State<ProofIdentityScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _capturedImage;

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _capturedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Content(
                data: "Proof Of Identity",
                size: 30.h,
                weight: FontWeight.w300,
              ),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Content(
                  data: "We need to make sure no one is impersonating you",
                  size: 16.h,
                  weight: FontWeight.w400,
                  family: "Lato",
                ),
              ),
              SizedBox(
                height: 61.h,
              ),
              GestureDetector(
                onTap: _openCamera,
                child: _capturedImage == null
                    ? Icon(
                        Icons.camera_alt_outlined,
                        size: 221.h,
                      )
                    : Image.file(
                        File(_capturedImage!.path),
                        width: 300.h,
                        height: 250.h,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 42.h,
              ),
              Content(
                data: "Please use clear photo",
                size: 16.h,
                weight: FontWeight.w400,
                family: "Lato",
              ),
              SizedBox(
                height: 100.h,
              ),
              Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    Utils.snackBar("Image inserted successfully", context);
                    navigate(context, InfluencerNavbarScreen());
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Lato",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
