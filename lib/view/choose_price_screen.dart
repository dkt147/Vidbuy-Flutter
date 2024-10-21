import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class ChoosePricesScreen extends StatefulWidget {
  final Function(Map<String, double>)
      onSave; // Callback function to save prices

  ChoosePricesScreen({required this.onSave});

  @override
  _ChoosePricesScreenState createState() => _ChoosePricesScreenState();
}

class _ChoosePricesScreenState extends State<ChoosePricesScreen> {
  double birthdayPrice = 15.0;
  double specialDayPrice = 20.0;
  double otherPrice = 45.0;
  bool samePriceForAll = false;
  double universalPrice = 0.0;

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
              SizedBox(
                height: 47.h,
              ),
              Text(
                "Choose Prices",
                style: TextStyle(
                  fontSize: 30.h,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "Choose how much to charge for each video",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 10.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 74.h),
              if (!samePriceForAll) ...[
                priceInputField(
                  "Choose Price for Birthday",
                  birthdayPrice,
                  (value) {
                    setState(() {
                      birthdayPrice = value;
                    });
                  },
                ),
                priceInputField(
                  "Choose Price for Special Day",
                  specialDayPrice,
                  (value) {
                    setState(() {
                      specialDayPrice = value;
                    });
                  },
                ),
                priceInputField(
                  "Choose Price for Other",
                  otherPrice,
                  (value) {
                    setState(() {
                      otherPrice = value;
                    });
                  },
                ),
              ],
              SizedBox(height: 100.h),
              Center(
                  child: Content(
                data: "OR",
                size: 30.h,
                weight: FontWeight.w300,
              )),
              // SizedBox(height: 16),
              Container(
                margin: EdgeInsets.only(right: 27.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text("Same price for all"),
                    Content(
                      data: "Same Price For All",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                    Checkbox(
                      value: samePriceForAll,
                      onChanged: (bool? value) {
                        setState(() {
                          samePriceForAll = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (samePriceForAll)
                priceInputField(
                  "Same price for all?",
                  universalPrice,
                  (value) {
                    setState(() {
                      universalPrice = value;
                    });
                  },
                ),
              // Spacer(),
              SizedBox(
                height: 27.h,
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
                    Map<String, double> prices;
                    if (samePriceForAll) {
                      prices = {
                        "Birthday": universalPrice,
                        "Special Day": universalPrice,
                        "Other": universalPrice,
                      };
                    } else {
                      prices = {
                        "Birthday": birthdayPrice,
                        "Special Day": specialDayPrice,
                        "Other": otherPrice,
                      };
                    }
                    widget.onSave(prices); // Save the selected prices
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
            ],
          ),
        ),
      ),
    );
  }

  Widget priceInputField(
      String label, double price, Function(double) onChanged) {
    return Padding(
      // padding:  EdgeInsets.symmetric(vertical: 17.h, horizontal: 10.w),
      padding: EdgeInsets.only(top: 17.h, right: 22.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 105.w,
            height: 35.h,
            child: TextField(
              keyboardType: TextInputType.number,
              // decoration: InputDecoration(
              //   prefixText: "€ ",
              //   border: OutlineInputBorder(),
              // ),
              decoration: new InputDecoration(
                // fillColor: Color(0xff908B8B),
                // fillColor: Color(0xffFFFFFF),
                fillColor: Colors.transparent,
                filled: true,
                // hintText: hint,
                hintStyle: TextStyle(
                    color: Color(0xff908B8B),
                    fontSize: 14.h,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w300),
                counterText: "",
                prefixText: "€ ",

                // Container(
                //     margin: EdgeInsets.symmetric(vertical: 13.h),
                //     child: GestureDetector(
                //         // onTap: () {
                //         //   value.togglePasswordVisibility(index);
                //         // },
                //         child: Icon(Icons.email))),
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide:
                      BorderSide(color: Color(0xff908B8B), width: 2.0.w),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide:
                      BorderSide(color: Color(0xff908B8B), width: 2.0.w),
                ),
                // errorStyle: InputDecoration.collapsed(hintText: hintText)
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
}
