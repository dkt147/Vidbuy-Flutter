import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/language_tile.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vidbuy_app/viewmodel/change_language_view_model.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

enum Language { english, portugese }

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedLanguageIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  data: AppLocalizations.of(context)!.language,
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Consumer<LanguageChangeViewModel>(
              builder: (context, provider, child) {
            return Column(
              children: [
                LanguageTile(
                  index: 0,
                  selectedIndex: selectedLanguageIndex,
                  language: "English",
                  onChanged: (index) {
                    setState(() {
                      selectedLanguageIndex = index;
                      provider.changeLanguage(Locale('en'));
                    });
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                LanguageTile(
                  index: 1,
                  selectedIndex: selectedLanguageIndex,
                  language: "Portugues",
                  onChanged: (index) {
                    setState(() {
                      selectedLanguageIndex = index;
                      provider.changeLanguage(Locale('pt'));
                    });
                  },
                ),
              ],
            );
          }),

          SizedBox(
            height: 12.h,
          ),
          // LanguageTile(
          //   index: 2,
          //   selectedIndex: selectedLanguageIndex,
          //   onChanged: (index) {
          //     setState(() {
          //       selectedLanguageIndex = index;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
