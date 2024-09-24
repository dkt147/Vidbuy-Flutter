import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class LanguageTile extends StatefulWidget {
  LanguageTile({
    super.key,
  });

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Divider(
        //   color: Colors.black,
        //   endIndent: 30.w,
        //   indent: 30.w,
        // ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 34.w, right: 34.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: "English",
                size: 16.h,
                weight: FontWeight.w400,
                family: "Nunito",
              ),
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
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
