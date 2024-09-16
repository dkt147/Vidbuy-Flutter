import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/stripe_connect_account_screen.dart';

class ProofIdentityScreen extends StatelessWidget {
   ProofIdentityScreen({super.key});
  final ImagePicker _picker = ImagePicker();

    Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print('Image captured: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
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
              Content(
                data: "We need to make sure no one is impersonating you",
                size: 16.h,
                weight: FontWeight.w400,
                family: "Lato",
              ),
              SizedBox(
                height: 61.h,
              ),
              GestureDetector(
                onTap: _openCamera,
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 221.h,
                ),
              ),
              SizedBox(
                height: 42.h,
              ),
              Content(
                data: "Please Watch The camera",
                size: 16.h,
                weight: FontWeight.w400,
                family: "Lato",
              ),
              SizedBox(
                height: 123.h,
              ),
              Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    navigate(context, StripeConnectAccountScreen());
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontSize: 20.h,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Lato",
                        color: Colors.white),
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
