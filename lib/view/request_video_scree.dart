import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/payment_confirm_screen.dart';

import '../Function/navigate.dart';

class RequestVideoScree extends StatefulWidget {
  String from;
  String to;
  String videoFor;
  String description;
  String videotTypeId;

  RequestVideoScree(
      {required this.from,
      required this.to,
      required this.videoFor,
      required this.description,
      required this.videotTypeId,
      super.key});

  @override
  State<RequestVideoScree> createState() => _RequestVideoScreeState();
}

class _RequestVideoScreeState extends State<RequestVideoScree> {
  Color _containerColor = Colors.transparent;
  bool isChecked = false;
  int _selectedIndex = -1; // Track the selected index
   double _deliveryCharge = 0.0; // Track the delivery charge


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
    double basePrice = double.tryParse(widget.videoFor) ?? 0.0;

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
                  data: "Create Order",
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
                  data: "When do you need your video?",
                  size: 16.h,
                  weight: FontWeight.w500,
                  family: "Lato",
                ),
                Content(
                  data:
                      "Delivers in up to 7 days but if you want early the extra charges will be required.",
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
                        _deliveryCharge = deliveryCharges[index]; // Update delivery charge
                      });
                    },
                    child: Container(
                      width: 340.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Color(0xffEAE9F1) // Change to desired color for selected
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
                              data: index == 0 ? "Included" : "€${deliveryCharges[index].toStringAsFixed(2)}",
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
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "Hide this video from [Influencer Name] profile",
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
                  data: "Review Order",
                  size: 16.h,
                  weight: FontWeight.w700,
                  family: "Lato",
                ),
                Content(
                  data:
                      "Your request will be delivered to the influencer and they will have to choose whether to accept it or not.",
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
                        data: "Order Price",
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
                            data: "Personalized Video",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€100.00",
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
                            data: "Services charges",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€100.00",
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
                            data: "Delivery charges",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€${_deliveryCharge.toStringAsFixed(2)}",
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
                            data: "Total",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€100.00",
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
                  child: Container(
                    width: 280.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_emailController.text.isEmpty) {
                        //   snackBar("Enter Valid Email", context);
                        // } else if (_passwordController.text.isEmpty) {
                        //   snackBar(
                        //     "Enter Password",
                        //     context,
                        //   );
                        // } else if (_passwordController.text.length < 8) {
                        //   snackBar(
                        //       "Enter Minium 8 Characters of Password", context);
                        // } else {
                        //   // Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(
                        //   //         builder: (_) => TabBarWidget()));
                        navigate(context, PaymentConfirmScreen());
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5271FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Request your Video",
                        style: TextStyle(
                            fontSize: 16.h,
                            color: Colors.white,
                            fontFamily: "Lato"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
