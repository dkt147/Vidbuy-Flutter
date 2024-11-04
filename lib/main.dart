import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Provider/influencer_navbar_provider.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/navbar_widget.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/services/nav.service.dart';
import 'package:vidbuy_app/services/storage.service.dart';
import 'package:vidbuy_app/view/admin_dashboard_screen.dart';
import 'package:vidbuy_app/view/influencer_navbar_screen.dart';
import 'package:vidbuy_app/view/influencer_profile_screen.dart';
import 'package:vidbuy_app/view/influencer_unique_profile.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
import 'package:vidbuy_app/view/splash_screen.dart';
import 'package:vidbuy_app/view/user_profile_screen.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_signup_view_model.dart';
import 'package:vidbuy_app/viewmodel/login_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/contact_us_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/create_order_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/home_screen_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/influencer_detail_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_search_screen_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_signup_view_model.dart';
import 'package:vidbuy_app/viewmodel/verify_otp_view_model.dart';

late SharedPreferences pref;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization
  pref = await SharedPreferences.getInstance(); // Initialize SharedPreferences

  LocalData ld = LocalData();
  await LocalData.loadToken();
  await ld.getTokenLocally();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavbarProvider()),
          ChangeNotifierProvider(create: (_) => InfluencerNavbarProvider()),
          ChangeNotifierProvider(create: (_) => InfluencerSignupViewModel()),
          ChangeNotifierProvider(create: (_) => UserSignupViewModel()),
          ChangeNotifierProvider(create: (_) => InfluencerSelectionViewModel()),
          ChangeNotifierProvider(create: (_) => OtpVerificationViewModel()),
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
          ChangeNotifierProvider(create: (_) => SearchScreenViewModel()),
          ChangeNotifierProvider(create: (_) => ContactUsViewModel()),
          ChangeNotifierProvider(create: (_) => InfluencerDetailViewModel()),
          ChangeNotifierProvider(create: (_) => CreateOrderViewModel()),
        ],
        child: Builder(builder: (BuildContext context) {
          return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(375, 812),
            // minTextAdapt: true,
            // splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  // title: 'First Method',
                  // You can use the library anywhere in the app even in theme
                  theme: ThemeData(
                    fontFamily: "LondrinaSolid",
                    scaffoldBackgroundColor: const Color(0xffFFFFFF),
                    scrollbarTheme: ScrollbarThemeData(
                      trackColor:
                          WidgetStateProperty.all(const Color(0xffFFFFFF)),
                    ),
                    useMaterial3: true,
                  ),
                  home: _getInitialScreen());
            },
          );
        }));
  }

  Widget _getInitialScreen() {
    if (LocalData.roleId == "1") {
      return AdminDashboardScreen();
    } else if (LocalData.roleId == "2") {
      return NavBarScreen();
    } else if (LocalData.roleId == "3") {
      return InfluencerNavbarScreen();
    } else {
      return SplashScreen();
    }
  }
}

// Future<String> _getInitialRoute() async {
//   StorageService storageService = StorageService();
//   String? token =
//       await storageService.get('token'); // Await the future to get the token
//   return (token != null && token.isNotEmpty)
//       ? Nav.navBar
//       : Nav.splash; // Check token and return route
// }
