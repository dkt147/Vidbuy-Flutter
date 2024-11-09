import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_profile_view_model.dart';

class DeleteConfirmAccountScreen extends StatelessWidget {
  const DeleteConfirmAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProfileViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/Icon/backarrow.png",
                height: 25.h,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 21.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: "Delete account",
                  size: 30.h,
                  weight: FontWeight.w300,
                ),
                Content(
                  data: "You won't be able to recover your account after this",
                  size: 16.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 140.h,
          ),

          Center(
            child: Consumer<UserProfileViewModel>(
              builder: (context, viewModel, child) {
                return Container(
                  width: 335.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: viewModel.deleteAccountLoading
                        ? null // Disable button if loading
                        : () {
                            viewModel.fetchDeleteAccountResponse(context);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffEC3434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: viewModel.deleteAccountLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            "Delete  Account",
                            style: TextStyle(
                                fontSize: 16.h,
                                color: Colors.white,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700),
                          ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: 18.h,
          ),
          // Center(
          //   child: Container(
          //     width: 335.w,
          //     height: 50.h,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         // if (_emailController.text.isEmpty) {
          //         //   snackBar("Enter Valid Email", context);
          //         // } else if (_passwordController.text.isEmpty) {
          //         //   snackBar(
          //         //     "Enter Password",
          //         //     context,
          //         //   );
          //         // } else if (_passwordController.text.length < 8) {
          //         //   snackBar(
          //         //       "Enter Minium 8 Characters of Password", context);
          //         // } else {
          //         //   // Navigator.push(
          //         //   //     context,
          //         //   //     MaterialPageRoute(
          //         //   //         builder: (_) => TabBarWidget()));
          //           // navigate(context, DeleteConfirmAccountScreen());
          //         // }
          //       },
          //       style: ElevatedButton.styleFrom(
          //         // backgroundColor: Color(0xffFFFFFF),

          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30.r),

          //         ),

          //       ),
          //       child: Text(
          //         "Cancel",
          //         style: TextStyle(fontSize: 16.h, color: Colors.black, fontFamily: "Lato", fontWeight: FontWeight.w700),
          //       ),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                width: 335.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: 16.h,
                        color: Colors.black,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
