import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/componenets/content.dart';

class PlatformFeesPage extends StatelessWidget {
  final List<Map<String, dynamic>> platformFeesData = [
    {
      "heading": "Platform Fee: VidBuy Fees",
      "description": "",
    },
    {
      "heading": "Last Updated:",
      "description": "19.07.2024",
    },
    {
      "heading": "1. Introduction",
      "description":
          "Welcome to the VidBuy Fees page. Here you will find information about the fees applicable to transactions made on our platform, as well as details about our payment processing.",
    },
    {
      "heading": "2. Transaction Fees",
      "description": "",
    },
    {
      "heading": "2.1. Video Purchase Fees",
      "description":
          "When purchasing a video through VidBuy, a processing fee is applied, which consists of:\n\n"
              "- 10% of the total transaction amount.\n"
              "- €0.25 per transaction.\n\n"
              "These fees cover the costs of processing and managing transactions.",
    },
    {
      "heading": "2.2. Donation Fees",
      "description": "For donations made through VidBuy, a processing fee of:\n\n"
          "- 30% of the total donation amount.\n\n"
          "This fee covers the costs associated with processing and managing donations.",
    },
    {
      "heading": "3. Payment Processing",
      "description":
          "We use Easypay to process all payments on our platform. Easypay is a secure payment service that enables you to make transactions safely. Through Easypay:\n\n"
              "- We do not have access to your credit card data.\n"
              "- We do not store sensitive financial or personal information.\n\n"
              "Easypay is responsible for collecting and managing payment data, ensuring that your financial information is handled securely and in compliance with data protection regulations.",
    },
    {
      "heading": "4. Security and Privacy",
      "description":
          "The security of your financial information is a priority for us. While VidBuy does not have access to your credit card data or banking information, Easypay employs rigorous security measures to protect this information from unauthorized access.",
    },
    {
      "heading": "5. Changes to Fees",
      "description":
          "We may update fees and transaction policies periodically. We recommend reviewing this page regularly to stay informed about any changes.",
    },
    {
      "heading": "6. Contact",
      "description":
          "If you have any questions about applicable fees or payment processing, please contact us:\n\n"
              "Email: company@vidbuy.pro",
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
                  data: "Platform fees",
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
                itemCount: platformFeesData.length,
                itemBuilder: (context, index) {
                  final item = platformFeesData[index];
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
