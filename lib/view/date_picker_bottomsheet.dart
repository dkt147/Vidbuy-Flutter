import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void showDatePickerBottomSheet(BuildContext context) {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    // setState(() {
    //   if (args.value is PickerDateRange) {
    //     _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
    //         // ignore: lines_longer_than_80_chars
    //         ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    //   } else if (args.value is DateTime) {
    //     _selectedDate = args.value.toString();
    //   } else if (args.value is List<DateTime>) {
    //     _dateCount = args.value.length.toString();
    //   } else {
    //     _rangeCount = args.value.length.toString();
    //   }
    // });
  }
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(30.r),
        topStart: Radius.circular(30.r),
      ),
    ),
    builder: (context) => Container(
      // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: 375.w,
      height: 467.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          BottomPicker.date(
            height: 272.h,
            pickerTitle: Text(
              "Select expiration date",
              style: TextStyle(
                  fontSize: 18.h,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Nunito"),
            ),
            // buttonPadding: 10.h,
            dateOrder: DatePickerDateOrder.dmy,
            initialDateTime: DateTime(1996, 10, 22),
            maxDateTime: DateTime.now(),
            minDateTime: DateTime(1980),
            pickerTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12.h,
            ),
            displaySubmitButton: false,
            onChange: (index) {
              print(index);
            },
            onSubmit: (index) {
              print(index);
            },
            // bottomPickerTheme: BottomPickerTheme.plumPlate,
          ),
          SizedBox(height: 16.h),
          Container(
            width: 137.w,
            height: 40.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              onPressed: () {
                // Action when the "Ask new video" button is pressed
              },
              child: Text(
                "Ask new video",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.h,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
