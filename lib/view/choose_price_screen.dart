// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:vidbuy_app/main.dart';
// import 'package:vidbuy_app/resources/componenets/content.dart';
// import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';

// class ChoosePricesScreen extends StatefulWidget {
//   final List<Map<String, dynamic>> selectedVideos;
//   final Function(Map<String, double>) onSave;

//   ChoosePricesScreen({required this.onSave, required this.selectedVideos});

//   @override
//   _ChoosePricesScreenState createState() => _ChoosePricesScreenState();
// }

// class _ChoosePricesScreenState extends State<ChoosePricesScreen> {

//     final influencerSelectionViewModel = Provider.of<InfluencerSelectionViewModel>;
//   bool samePriceForAll = false;
//   double universalPrice = 0.0;
//  Timer? _debounce;

//    final Map<String, TextEditingController> _controllers = {};

//   // Debounced price change handler
//   void _onPriceChanged(String price, String id) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();

//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       // Accessing the ViewModel and calling the fetchInfluencerPriceData method
//       Provider.of<InfluencerSelectionViewModel>(context, listen: false).fetchInfluencerPriceData(
//         context,
//         price: price,
//         id: id,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _debounce?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Color(0xffFFFFFF),
//       body: Container(
//         margin: EdgeInsets.only(left: 21.w),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 47.h,
//               ),
//               Text(
//                 "Choose Prices",
//                 style: TextStyle(
//                   fontSize: 30.h,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//               Text(
//                 "Choose how much to charge for each video",
//                 style: TextStyle(
//                   fontFamily: "Nunito",
//                   fontSize: 10.h,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 74.h),
//               for (var video in widget.selectedVideos) ...[
//                 if (!samePriceForAll) ...[
//                   priceInputField(
//                     "Choose Price for ${video['name']}",
//                     0.0, // Default price, adjust this as needed
//                     (value) {
//                       _onPriceChanged(value.toString(), video['id'].toString());
//                     },
//                   ),
//                 ],
//               ],
//               SizedBox(height: 100.h),
//               Center(
//                   child: Content(
//                 data: "OR",
//                 size: 30.h,
//                 weight: FontWeight.w300,
//               )),
//               // SizedBox(height: 16),
//               Container(
//                 margin: EdgeInsets.only(right: 27.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Text("Same price for all"),
//                     Content(
//                       data: "Same Price For All",
//                       size: 16.h,
//                       family: "Lato",
//                       weight: FontWeight.w500,
//                     ),
//                     Checkbox(
//                       value: samePriceForAll,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           samePriceForAll = value ?? false;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               if (samePriceForAll)
//                 priceInputField(
//                   "Same price for all?",
//                   universalPrice,
//                   (value) {

//                   },
//                 ),
//               // Spacer(),
//               SizedBox(
//                 height: 27.h,
//               ),
//               Container(
//                 width: 335.w,
//                 height: 50.h,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xff5271FF),
//                     // padding:
//                     //     EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.r),
//                     ),
//                   ),
//                   onPressed: () {
//                     if (samePriceForAll) {
//                     } else {
//                     }
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Review",
//                         style: TextStyle(
//                             fontSize: 20.h,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "Lato",
//                             color: Colors.white),
//                       ),
//                       SizedBox(width: 10.w),
//                       Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget priceInputField(
//       String label, double price, Function(double) onChanged) {
//     return Padding(
//       // padding:  EdgeInsets.symmetric(vertical: 17.h, horizontal: 10.w),
//       padding: EdgeInsets.only(top: 17.h, right: 22.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontFamily: "Lato",
//               fontSize: 16.h,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(
//             width: 105.w,
//             height: 35.h,
//             child: TextField(
//               keyboardType: TextInputType.number,
//               // decoration: InputDecoration(
//               //   prefixText: "€ ",
//               //   border: OutlineInputBorder(),
//               // ),
//               decoration: new InputDecoration(
//                 // fillColor: Color(0xff908B8B),
//                 // fillColor: Color(0xffFFFFFF),
//                 fillColor: Colors.transparent,
//                 filled: true,
//                 // hintText: hint,
//                 hintStyle: TextStyle(
//                     color: Color(0xff908B8B),
//                     fontSize: 14.h,
//                     fontFamily: "Lato",
//                     fontWeight: FontWeight.w300),
//                 counterText: "",
//                 prefixText: "€ ",

//                 // Container(
//                 //     margin: EdgeInsets.symmetric(vertical: 13.h),
//                 //     child: GestureDetector(
//                 //         // onTap: () {
//                 //         //   value.togglePasswordVisibility(index);
//                 //         // },
//                 //         child: Icon(Icons.email))),
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.r),
//                   borderSide:
//                       BorderSide(color: Color(0xff908B8B), width: 2.0.w),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.r),
//                   borderSide:
//                       BorderSide(color: Color(0xff908B8B), width: 2.0.w),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.r),
//                   borderSide:
//                       BorderSide(color: Color(0xff908B8B), width: 2.0.w),
//                 ),
//                 focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.r),
//                   borderSide:
//                       BorderSide(color: Color(0xff908B8B), width: 2.0.w),
//                 ),
//                 // errorStyle: InputDecoration.collapsed(hintText: hintText)
//               ),
//               onChanged: (value) {
//                 onChanged(double.tryParse(value) ?? 0.0);
//               },
//               controller: TextEditingController(
//                 text: price.toString(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';

class ChoosePricesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedVideos;
  // final Function(Map<String, double>) onSave;
  final VoidCallback onNextTab;

  ChoosePricesScreen(
      {
      // required this.onSave,
      required this.selectedVideos,
      required this.onNextTab});

  @override
  _ChoosePricesScreenState createState() => _ChoosePricesScreenState();
}

class _ChoosePricesScreenState extends State<ChoosePricesScreen> {
  bool samePriceForAll = false;
  double universalPrice = 0.0;
  Timer? _debounce; // Add a Timer variable for debouncing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        margin: EdgeInsets.only(left: 21.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 47.h),
              Text("Choose Prices",
                  style:
                      TextStyle(fontSize: 30.h, fontWeight: FontWeight.w300)),
              Text("Choose how much to charge for each video",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 10.h,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 74.h),
              for (var video in widget.selectedVideos) ...[
                if (!samePriceForAll) ...[
                  priceInputField(
                    "Choose Price for ${video['name']}",
                    0,
                    (value) {
                      _onPriceChanged(value.toString(), video['id'].toString());
                    },
                  ),
                ],
              ],

              SizedBox(
                height: 100.h,
              ),

              Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    widget.onNextTab();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Review",
                        style: TextStyle(
                            fontSize: 20.h,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Lato",
                            color: Colors.white),
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              // Other UI elements...
            ],
          ),
        ),
      ),
    );
  }

  // Debounced price change handler
  void _onPriceChanged(String price, String id) {
    // Cancel any existing debounce timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Set a new debounce timer
    _debounce = Timer(const Duration(seconds: 2), () {
      // Call your ViewModel function to send the price data after user stops typing
      Provider.of<InfluencerSelectionViewModel>(context, listen: false)
          .fetchInfluencerPriceData(
        context,
        price: price.toString(),
        id: id.toString(),
      );
    });
  }

  Widget priceInputField(String label, int price, Function(double) onChanged) {
    return Padding(
      padding: EdgeInsets.only(top: 17.h, right: 22.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            width: 105.w,
            height: 35.h,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(
                    color: Color(0xff908B8B),
                    fontSize: 14.h,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w300),
                counterText: "",
                prefixText: "€ ",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide:
                      BorderSide(color: Color(0xff908B8B), width: 2.0.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide:
                      BorderSide(color: Color(0xff908B8B), width: 2.0.w),
                ),
              ),
              onChanged: (value) {
                onChanged(double.tryParse(value) ?? 0.0);
              },
              controller: TextEditingController(
                text: price.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Don't forget to dispose the debounce timer to avoid memory leaks
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
