import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/log_out_view_model.dart';

class AccountRejectedScreen extends StatefulWidget {
  const AccountRejectedScreen({super.key});

  @override
  State<AccountRejectedScreen> createState() => _AccountRejectedScreenState();
}

class _AccountRejectedScreenState extends State<AccountRejectedScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<LogoutProfileViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 33.w, top: 56.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.more_vert_rounded),
                 Consumer<LogoutProfileViewModel>(
                      builder: (context, viewModel, child) {
                    return GestureDetector(
                      onTap: (){
                        viewModel.fetchLogOutAccountResponse(context);
                      },
                      child: Container(
                        width: 101.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                            child: Content(
                          data: "Logout",
                          size: 16.h,
                          family: "Lato",
                          color: Colors.black,
                        )),
                      ),
                    );
                      }
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18.h,
                  ),
                  Content(
                    data: "Account Rejected!!",
                    size: 30.h,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Content(
                    data: "For some reason your account was not approved",
                    size: 16.h,
                    weight: FontWeight.w400,
                    family: "Lato",
                  ),
                  SizedBox(
                    height: 61.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      // navigate(context, AccountRejectedScreen());
                    },
                    child: Icon(
                      Icons.person,
                      size: 221.h,
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  SizedBox(
                    height: 123.h,
                  ),
                  Content(
                    data: "You can log out whenever you want",
                    size: 16.h,
                    weight: FontWeight.w400,
                    family: "Lato",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
