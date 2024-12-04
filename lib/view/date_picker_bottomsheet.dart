// import 'package:bottom_picker/bottom_picker.dart';
// import 'package:bottom_picker/resources/arrays.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// void showDatePickerBottomSheet(BuildContext context) {
//   String _selectedDate = '';
//   String _dateCount = '';
//   String _range = '';
//   String _rangeCount = '';

//   /// The method for [DateRangePickerSelectionChanged] callback, which will be
//   /// called whenever a selection changed on the date picker widget.
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     /// The argument value will return the changed date as [DateTime] when the
//     /// widget [SfDateRangeSelectionMode] set as single.
//     ///
//     /// The argument value will return the changed dates as [List<DateTime>]
//     /// when the widget [SfDateRangeSelectionMode] set as multiple.
//     ///
//     /// The argument value will return the changed range as [PickerDateRange]
//     /// when the widget [SfDateRangeSelectionMode] set as range.
//     ///
//     /// The argument value will return the changed ranges as
//     /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
//     /// multi range.
//     // setState(() {
//     //   if (args.value is PickerDateRange) {
//     //     _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
//     //         // ignore: lines_longer_than_80_chars
//     //         ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
//     //   } else if (args.value is DateTime) {
//     //     _selectedDate = args.value.toString();
//     //   } else if (args.value is List<DateTime>) {
//     //     _dateCount = args.value.length.toString();
//     //   } else {
//     //     _rangeCount = args.value.length.toString();
//     //   }
//     // });
//   }
//   showModalBottomSheet(
//     backgroundColor: Colors.white,
//     isScrollControlled: true,
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadiusDirectional.only(
//         topEnd: Radius.circular(30.r),
//         topStart: Radius.circular(30.r),
//       ),
//     ),
//     builder: (context) => Container(
//       // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//       width: 375.w,
//       height: 467.h,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(height: 16.h),
//           BottomPicker.date(
//             height: 272.h,
//             pickerTitle: Text(
//               "Select expiration date",
//               style: TextStyle(
//                   fontSize: 18.h,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: "Nunito"),
//             ),
//             // buttonPadding: 10.h,
//             dateOrder: DatePickerDateOrder.dmy,
//             initialDateTime: DateTime(1996, 10, 22),
//             maxDateTime: DateTime.now(),
//             minDateTime: DateTime(1980),
//             pickerTextStyle: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 12.h,
//             ),
//             displaySubmitButton: true,
//             onChange: (index) {
//               print(index);
//             },
//             onSubmit: (index) {
//               print(index);
//             },
//             // bottomPickerTheme: BottomPickerTheme.plumPlate,
//           ),
//           SizedBox(height: 16.h),
//           Container(
//             width: 137.w,
//             height: 40.h,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.r),
//                 ),
//               ),
//               onPressed: () {
//                 // Action when the "Ask new video" button is pressed
//               },
//               child: Text(
//                 "Ask new video",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.h,
//                   fontFamily: "Lato",
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void showDatePickerBottomSheet(
    BuildContext context, String orderId, Function(String) onDateSelected) {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (_) => StatefulBuilder(
      builder: (context, modalSetState) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Expiration Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              // height: 320.h,
              child: TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime(2100, 12, 31),
                focusedDay: focusedDate,
                selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                onDaySelected: (newSelectedDay, newFocusedDay) {
                  if (!newSelectedDay.isBefore(DateTime.now())) {
                    modalSetState(() {
                      selectedDate = newSelectedDay;
                      focusedDate = newFocusedDay;
                    });
                  }
                },
                calendarStyle: CalendarStyle(
                  // outsideDaysVisible: false,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    ),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.black),
                  weekendDecoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.rectangle,
                  ),
                  defaultDecoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.rectangle,
                  ),
                ),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    headerPadding: EdgeInsets.zero),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 137.w,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      onPressed: () {
                        // Combine selected date with the current time
                        DateTime finalDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          DateTime.now().hour,
                          DateTime.now().minute,
                          DateTime.now().second,
                        );
                        String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss')
                            .format(finalDateTime);
                        Navigator.pop(context); // Close the bottom sheet
                        onDateSelected(
                            formattedDate); // Pass the final timestamp
                      },
                      child: Center(
                        child: Text(
                          "Ask new video",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.h,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
