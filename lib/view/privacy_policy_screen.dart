import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final List<Map<String, String>> privacyPolicyData = [
    {
      "heading": "PRIVACY POLICY",
      "description":
          "The processing of your data is done in compliance with the legislation on personal data protection. The data, subject to computerized processing, will be part of VidBuy’s database(s) and are intended for registration and presentation of other products and services, as well as institutional information to be made available by them.",
    },
    {
      "heading": "",
      "description":
          "Providing this data is optional, and according to the law, you are guaranteed the right to access, rectify, and cancel any data that directly concerns you, either personally or in writing, directly to the address listed on the homepage of this website.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/Icon/backarrow.png",
                    height: 25.h,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Content(
                  data: "Privacy Policy",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: privacyPolicyData.length,
                itemBuilder: (context, index) {
                  final item = privacyPolicyData[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item['heading']!.isNotEmpty)
                        Text(
                          item['heading']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      const SizedBox(height: 8),
                      if (item['description']!.isNotEmpty)
                        Text(
                          item['description']!,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
