import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_profile_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProfileViewModel>(context, listen: false);
    return Scaffold(
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
                  data: AppLocalizations.of(context)!.userChangePassword,
                  size: 30.h,
                  weight: FontWeight.w300,
                ),
                Content(
                  data: AppLocalizations.of(context)!.userToConfirmyourIdentity,
                  size: 16.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
                SizedBox(
                  height: 40.h,
                ),
                ContentFieldPassword(
                  label: AppLocalizations.of(context)!.userOldPassword,
                  hint: AppLocalizations.of(context)!.userPassword,
                  index: 0, // Add this line
                  controller: _oldPasswordController,
                  inputFormat: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  keyboardType: TextInputType
                      .visiblePassword, // This line is also included
                ),
                SizedBox(
                  height: 31.h,
                ),
                ContentFieldPassword(
                  label: AppLocalizations.of(context)!.userNewPassword,
                  hint: AppLocalizations.of(context)!.userPassword,
                  index: 0, // Add this line
                  controller: _newPasswordController,
                  inputFormat: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  keyboardType: TextInputType
                      .visiblePassword, // This line is also included
                ),
              ],
            ),
          ),
          SizedBox(
            height: 31.h,
          ),
          Center(
            child: Consumer<UserProfileViewModel>(
              builder: (context, viewModel, child) {
                return Container(
                  width: 280.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: viewModel.changePasswordLoading
                        ? null // Disable button if loading
                        : () {
                            if (_oldPasswordController.text.length < 8) {
                              Utils.snackBar(
                                  "Please enter correct old password", context);
                            } else if (_newPasswordController.text.length < 8) {
                              Utils.snackBar(
                                  "Please enter correct new password", context);
                            } else {
                              viewModel.fetchChangePasswordResponse(
                                  context,
                                  _oldPasswordController.text.toString(),
                                  _newPasswordController.text.toString(), () {
                                _newPasswordController.clear();
                                _oldPasswordController.clear();
                              });
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: viewModel.changePasswordLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            AppLocalizations.of(context)!.userChangePassword,
                            style: TextStyle(
                              fontSize: 20.h,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
