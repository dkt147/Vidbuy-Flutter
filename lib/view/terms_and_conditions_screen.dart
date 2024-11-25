import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class TermsAndConditionsPage extends StatelessWidget {
  final List<Map<String, String>> termsData = [
    {
      "heading": "TERMS AND CONDITIONS (SERVICE)",
      "description": "",
    },
    {
      "heading": "ARTICLE 1 – OBJECT",
      "description":
          "These general terms and conditions of sale aim to provide and define all the necessary information for the User regarding the order, sale, payment, and service provision modalities conducted on the website www.vidbuy.pro.\n"
              "These conditions govern all the steps necessary to complete the purchase and ensure the follow-up of this service to the User.",
    },
    {
      "heading": "ARTICLE 2 – ORDER",
      "description": "The User places their order by completing the purchase process presented on the website www.vidbuy.pro, adding the product(s) or service(s) they wish to order to the shopping cart.\n"
          "To submit their order, the User must:\n"
          "a) Register on the website www.vidbuy.pro, providing the requested information.\n\n"
          "b) Log in (by providing a combination of email and password chosen by the User during registration).\n\n"
          "c) Complete the information and select the options made available throughout the order completion process (delivery and billing address, shipping method, payment method, as well as the tax identification number and name to appear on the invoice for tax purposes).\n\n"
          "The User’s final confirmation of the order constitutes full and complete acceptance of the prices and description of the products/services available for sale as well as these General Terms and Conditions of Sale, which will be the only ones applicable to the contract thus concluded.\n\n"
          "VidBuy will honor the orders received online.\n\n"
          "In the event of service unavailability, VidBuy commits to informing the User as soon as possible.\n\n"
          "The details provided on the invoice are the sole responsibility of the User. The invoice cannot be reissued with changes after it has been issued.\n\n"
          "If payment for the invoice is not received by the services within the indicated deadline, the order will not be guaranteed.",
    },
    {
      "heading": "ARTICLE 3 – PAYMENT",
      "description":
          "On the website www.vidbuy.pro, VidBuy offers the User the following payment methods via Stripe:\n"
              "a) Credit card (Visa, Mastercard);\n\n"
              "b) Multibanco reference;\n\n"
              "c) Bank transfer.\n\n"
              "In the case of payment by credit card, the debit will be made immediately after confirmation of the service provision capability. If any of the ordered services cannot be provided, the value of these services will be credited to the User's card after the order is closed.",
    },
    {
      "heading": "ARTICLE 4 – AVAILABILITY AND CONSUMPTION",
      "description":
          "The service will be made available after payment confirmation.",
    },
    {
      "heading": "ARTICLE 5 – PRICES",
      "description":
          "Prices are in Euros, including taxes and fees, considering the VAT in force at the time of order payment.\n\n"
              "If there is an increase in the price of any service, the User will be immediately informed, and they may choose to continue their order (paying the difference) or cancel it.",
    },
    {
      "heading": "ARTICLE 6 – CANCELLATION AND RETURN",
      "description":
          "The cancellation or return process is handled on a case-by-case basis by VidBuy. The request must be submitted in writing to the contact email company@vidbuy.pro, within 14 days after the order, and the cancellation or refund instructions will be defined and responded to by the VidBuy through the same means of communication.\n\n"
              "Whenever possible, the return should be made using the same payment method, but if this is not possible, the User must provide proof of payment and account or card ownership for the return to be made by Bank Transfer.",
    },
    {
      "heading": "ARTICLE 7 – PRIVACY POLICY",
      "description":
          "The processing of your data is done in compliance with the legislation on personal data protection. The data, subject to computerized processing, will be part of VidBuy’s database(s) and are intended for registration and presentation of other products and services, as well as institutional information to be made available by them.\n\n"
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
                  data: "Terms and conditions",
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
                itemCount: termsData.length,
                itemBuilder: (context, index) {
                  final item = termsData[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['heading']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
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
