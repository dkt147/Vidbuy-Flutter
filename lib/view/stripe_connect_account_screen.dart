import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/pending_account_screen.dart';

class StripeConnectAccountScreen extends StatelessWidget {
  const StripeConnectAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                navigate(context, PendingAccountScreen());
              },
              child: Center(
                  child: Content(data: "STRIPE CONNECT ACCOUNT", size: 30.h)))
        ],
      ),
    );
  }
}
