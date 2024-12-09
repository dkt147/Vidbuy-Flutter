import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/payment_confirm_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/create_order_view_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Function/navigate.dart';

// ignore: must_be_immutable
class RequestVideoScreen extends StatefulWidget {
  final String influencerId;
  final String influencerName;
  final String from;
  final String to;
  final String videoFor;
  final String description;
  final String videotTypeId;
  final String videoPrice;

  RequestVideoScreen(
      {required this.influencerId,
      required this.influencerName,
      required this.from,
      required this.to,
      required this.videoFor,
      required this.description,
      required this.videotTypeId,
      required this.videoPrice,
      super.key});

  @override
  State<RequestVideoScreen> createState() => _RequestVideoScreenState();
}

class _RequestVideoScreenState extends State<RequestVideoScreen> {
  Color _containerColor = Colors.transparent;
  int hide = 0;
  bool isChecked = false;
  int _selectedIndex = -1; // Track the selected index
  double deliveryCharge = 0.0;
  String days = "";
  int? day;
  // Track the delivery charge

  final List<String> texts = [
    "7 Days",
    "3 Days",
    "24 Hours",
  ];

  //  final List<double> deliveryCharges = [
  //   0.0, // Option 1: €0.00 delivery charge
  //   200 * 0.3, // Option 2: 30% of 200
  //   200 * 0.6, // Option 3: 60% of 200
  // ];

  @override
  Widget build(BuildContext context) {
    Provider.of<CreateOrderViewModel>(context, listen: false);
    double basePrice = double.tryParse(widget.videoPrice) ?? 0.0;
    double serviceCharge = 12.35;

    // List of delivery charges based on the converted price
    final List<double> deliveryCharges = [
      0.0, // Option 1: €0.00 delivery charge
      basePrice * 0.3, // Option 2: 30% of the price
      basePrice * 0.6, // Option 3: 60% of the price
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 55.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 21.w),
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
                  data: AppLocalizations.of(context)!.userCreateOrder,
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 19.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: AppLocalizations.of(context)!.userWhenDoYouNeed,
                  size: 16.h,
                  weight: FontWeight.w500,
                  family: "Lato",
                ),
                Content(
                  data: AppLocalizations.of(context)!.userDeliverUpto,
                  size: 14.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 39.h,
          ),

          Column(
            children: List.generate(texts.length, (index) {
              return Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index; // Update selected index
                          deliveryCharge =
                              deliveryCharges[index]; // Update delivery charge

                          days = texts[index];

                          int? getNumberFromText(String text) {
                            // Use a regular expression to match only the numeric part
                            final RegExp regExp = RegExp(r'\d+');
                            final match = regExp.firstMatch(text);

                            if (match != null) {
                              int number = int.parse(match.group(0)!);
                              // Check if the number is 24, then set it to 1
                              return number == 24 ? 1 : number;
                            }

                            return null; // Return null if no number is found
                          }

                          day = getNumberFromText(days);
                        });
                      },
                      child: Container(
                        width: 340.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? Color(
                                  0xffEAE9F1) // Change to desired color for selected
                              : Colors.white, // Default color for unselected
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 28, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Content(
                                data: texts[index], // Use text from the list
                                size: 16,
                                family: "Lato",
                                weight: FontWeight.w500,
                              ),
                              Content(
                                data: index == 0
                                    ? "Included"
                                    : "€${deliveryCharges[index].toStringAsFixed(2)}",
                                size: 16,
                                family: "Lato",
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h), // Add spacing between items
                ],
              );
            }),
          ),
          // Center(
          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         _containerColor =
          //             Color(0xffEAE9F1); // Change to desired color
          //       });
          //     },
          //     child: Container(
          //       width: 340.w,
          //       height: 50.h,
          //       decoration: BoxDecoration(
          //         color: _containerColor, // Apply the dynamic color here
          //         border: Border.all(color: Colors.black),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Container(
          //         margin: EdgeInsets.only(left: 28, right: 10),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Content(
          //               data: "7 Days",
          //               size: 16,
          //               family: "Lato",
          //               weight: FontWeight.w500,
          //             ),
          //             Content(
          //               data: "Included",
          //               size: 16,
          //               family: "Lato",
          //               weight: FontWeight.w500,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 12.h,
          // ),
          // Center(
          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         _containerColor =
          //             Color(0xffEAE9F1); // Change to desired color
          //       });
          //     },
          //     child: Container(
          //       width: 340.w,
          //       height: 50.h,
          //       decoration: BoxDecoration(
          //         color: _containerColor, // Apply the dynamic color here
          //         border: Border.all(color: Colors.black),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Container(
          //         margin: EdgeInsets.only(left: 28, right: 10),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Content(
          //               data: "7 Days",
          //               size: 16,
          //               family: "Lato",
          //               weight: FontWeight.w500,
          //             ),
          //             Content(
          //               data: "Included",
          //               size: 16,
          //               family: "Lato",
          //               weight: FontWeight.w500,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 12.h,
          // ),
          // Center(
          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         _containerColor =
          //             Color(0xffEAE9F1); // Change to desired color
          //       });
          //     },
          //     child: Container(
          //       width: 340.w,
          //       height: 50.h,
          //       decoration: BoxDecoration(
          //         color: _containerColor, // Apply the dynamic color here
          //         border: Border.all(color: Colors.black),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Container(
          //         margin: EdgeInsets.only(left: 28, right: 10),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Content(
          //               data: "7 Days",
          //               size: 16,
          //               family: "Lato",
          //               weight: FontWeight.w500,
          //             ),
          //             Content(
          //               data: "Included",
          //               size: 16,
          //               family: "Lato",
          //               weight: FontWeight.w500,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(left: 17.w),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked, // Assuming isChecked is a boolean variable
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false; // Update the boolean value
                      hide = isChecked
                          ? 1
                          : 0; // Save the value as 1 if true, 0 if false
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "Hide this video from ${widget.influencerName} profile",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.h,
                        fontFamily: "Lato"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: AppLocalizations.of(context)!.userReviewOrder,
                  size: 16.h,
                  weight: FontWeight.w700,
                  family: "Lato",
                ),
                Content(
                  data: AppLocalizations.of(context)!.userYourRequest,
                  size: 14.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, right: 22.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Content(
                        data: AppLocalizations.of(context)!.userOrderPrice,
                        size: 16.h,
                        weight: FontWeight.w700,
                        family: "Lato",
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: AppLocalizations.of(context)!
                                .userPersonalizedVideo,
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€${basePrice}",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: AppLocalizations.of(context)!
                                .userServiceCharges,
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€${serviceCharge}",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: AppLocalizations.of(context)!
                                .userDeliveryCharges,
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€${deliveryCharge}",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: AppLocalizations.of(context)!.userTotal,
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data:
                                "€${(basePrice + serviceCharge + deliveryCharge).toStringAsFixed(2)}",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 54.h,
                ),
                Center(
                  child: Consumer<CreateOrderViewModel>(
                      builder: (context, viewModel, child) {
                    return Container(
                      width: 280.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: viewModel.loading
                            ? null // Disable button if loading
                            : () {
                                if (day == null) {
                                  Utils.snackBar(
                                      "Please select delivery type", context);
                                } else {
                                  int deliveryday = day!;

                                  viewModel.fetchCreateUserOrderResponse(
                                      context,
                                      influencerId:
                                          widget.influencerId.toString(),
                                      videoTypeId:
                                          widget.videotTypeId.toString(),
                                      videoFor: widget.videoFor.toString(),
                                      from: widget.from.toString(),
                                      to: widget.to.toString(),
                                      description:
                                          widget.description.toString(),
                                      requiredDays: deliveryday,
                                      deliveryCharges:
                                          deliveryCharge.toString(),
                                      hide: hide.toString());
                                }

                                // navigate(context, PaymentConfirmScreen());
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5271FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: viewModel.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                AppLocalizations.of(context)!
                                    .userRequestYourVideo,
                                style: TextStyle(
                                    fontSize: 16.h,
                                    color: Colors.white,
                                    fontFamily: "Lato"),
                              ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
