import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class ContactInformationPage extends StatelessWidget {
  final List<Map<String, dynamic>> contactUsData = [
    {
      "heading": "Contact Information: Contact Us",
      "description": "",
    },
    {
      "heading": "Last Updated:",
      "description": "19.07.2024",
    },
    {
      "heading": "We value your feedback",
      "description":
          "We are here to assist you with any questions or concerns you may have. Here’s how you can get in touch with us:",
    },
    {
      "heading": "Support Hours",
      "description":
          "Our support team is available to assist you from Monday to Saturday, between 10:00 AM and 10:00 PM.",
    },
    {
      "heading": "Contact Information",
      "description": "Email: company@vidbuy.pro\n\n"
          "For any inquiries, issues, or support requests, please reach out to us through the provided email address. We aim to respond to all inquiries promptly within our support hours.",
    },
    {
      "heading": "Thank You!",
      "description":
          "Thank you for choosing VidBuy. We look forward to assisting you!",
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
                  data: "Contact Information",
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
                itemCount: contactUsData.length,
                itemBuilder: (context, index) {
                  final item = contactUsData[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item['heading'] != null &&
                          item['heading']!.isNotEmpty)
                        Text(
                          item['heading'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      const SizedBox(height: 8),
                      if (item['description'] != null &&
                          item['description']!.isNotEmpty)
                        Text(
                          item['description'],
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
