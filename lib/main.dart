import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/view/admin_influencer_screen.dart';
import 'package:vidbuy_app/view/cancel_screen.dart';
import 'package:vidbuy_app/view/pending_admin_screen.dart';
import 'package:vidbuy_app/view/splash_screen.dart';

late SharedPreferences pref;
Future<void> main() async {
  runApp(const MyApp());

  await ScreenUtil.ensureScreenSize();
  pref = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'VidBuy App',
            theme: ThemeData(
              fontFamily: "LondrinaSolid",
              scaffoldBackgroundColor: Color(0xffFFFFFF),
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              scrollbarTheme: ScrollbarThemeData(
                trackColor: MaterialStateProperty.all(Color(0xffFFFFFF)),
              ),
              useMaterial3: true,
            ),
            home: MainTabbarAdminWidget(
              tabTitles: [
                "Pending Request",
                "Approved",
                "Canceled"
                
              ],
              screens: [
                          PendingAdminScreen(),
                          PendingAdminScreen(),
                          CancelScreen(),
              ],
            )
            
            // InfluencerChart(),
          );
        },
      ),
    );
  }
}
