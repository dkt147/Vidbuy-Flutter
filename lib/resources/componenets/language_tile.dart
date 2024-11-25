import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class LanguageTile extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  String language;

  LanguageTile({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onChanged,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 34.w, right: 34.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data:
                    language, // You can modify this text dynamically if needed
                size: 16.h,
                weight: FontWeight.w400,
                family: "Nunito",
              ),
              Checkbox(
                value: selectedIndex == index,
                onChanged: (value) {
                  if (value == true) {
                    onChanged(index);
                  }
                },
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          endIndent: 30.w,
          indent: 30.w,
        ),
      ],
    );
  }
}
