import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void bottomSheetWidget(BuildContext context) {
  TextEditingController phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final PageController controller = PageController(initialPage: 0);

  int? selectedAmountIndex;

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
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Container(
        padding: EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          bottom: 30,
          top: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 467.h,
              width: 375.w,
              child: PageView(
                controller: controller,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.close),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DonationAmountButton(
                              amount: "€20",
                              isSelected: selectedAmountIndex == 0,
                              onTap: () {
                                setState(() {
                                  selectedAmountIndex = 0;
                                });
                              },
                            ),
                            DonationAmountButton(
                              amount: "€40",
                              isSelected: selectedAmountIndex == 1,
                              onTap: () {
                                setState(() {
                                  selectedAmountIndex = 1;
                                });
                              },
                            ),
                            DonationAmountButton(
                              amount: "€60",
                              isSelected: selectedAmountIndex == 2,
                              onTap: () {
                                setState(() {
                                  selectedAmountIndex = 2;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "€ Custom Amount",
                            hintStyle: TextStyle(
                                fontFamily: "Lato",
                                // height: 14.h,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffC7C3C3)
                              ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 16.h),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: 364.w,
                          height: 164.h,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type here your message",
                              hintStyle: TextStyle(
                                fontFamily: "Lato",
                                // height: 14.h,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffC7C3C3)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 16.h),
                            ),
                            maxLines: 4,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: 100.w,
                          height: 40.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 24.w, vertical: 16.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Donate",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.h,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class DonationAmountButton extends StatelessWidget {
  final String amount;
  final bool isSelected;
  final VoidCallback onTap;

  const DonationAmountButton({
    required this.amount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff5271FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.black45),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Text(
          amount,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 18.h,
            fontFamily: "Lato",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// void showDonationBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
//     ),
//     builder: (context) {
//       return DonationBottomSheetWidget();
//     },
//   );
// }