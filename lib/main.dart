import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Provider/admin_navbar_provider.dart';
import 'package:vidbuy_app/Provider/influencer_navbar_provider.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';
import 'package:vidbuy_app/notification_services/notification_services.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/account_rejected_screen.dart';
import 'package:vidbuy_app/view/admin_navbar_screen.dart';
import 'package:vidbuy_app/view/influencer_navbar_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
import 'package:vidbuy_app/view/pending_account_screen.dart';
import 'package:vidbuy_app/view/splash_screen.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_influencer_list_view_model.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_rejected_orders_view_model.dart';
import 'package:vidbuy_app/viewmodel/change_language_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_signup_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencers_orders_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/setting_view_model.dart';
import 'package:vidbuy_app/viewmodel/log_out_view_model.dart';
import 'package:vidbuy_app/viewmodel/login_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/contact_us_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/create_order_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/home_screen_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/influencer_detail_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_orders_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_profile_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_search_screen_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_signup_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_task_detail_view_model.dart';
import 'package:vidbuy_app/viewmodel/verify_otp_view_model.dart';

late SharedPreferences pref;

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization

  await Firebase.initializeApp();
  await NotificationServices().initNotifications();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  pref = await SharedPreferences.getInstance(); // Initialize SharedPreferences
  final String languageCode = pref.getString("langauge_code") ?? "";

  LocalData ld = LocalData();
  await LocalData.loadToken();
  await ld.getTokenLocally();

  runApp(MyApp(
    locale: languageCode,
  ));
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print(message.notification!.title.toString());
// }

class MyApp extends StatelessWidget {
  final String? locale;
  MyApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavbarProvider()),
          ChangeNotifierProvider(create: (_) => InfluencerNavbarProvider()),
          ChangeNotifierProvider(create: (_) => AdminNavbarProvider()),
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
          ChangeNotifierProvider(create: (_) => InfluencerOrdersViewModel()),
          ChangeNotifierProvider(create: (_) => UserOrdersViewModel()),
          ChangeNotifierProvider(create: (_) => LanguageChangeViewModel()),
          ChangeNotifierProvider(
              create: (_) => InfluencerTaskDetailViewModel()),
          ChangeNotifierProvider(create: (_) => SettingViewModel()),
          ChangeNotifierProvider(create: (_) => UserTaskDetailViewModel()),
          ChangeNotifierProvider(create: (_) => UserProfileViewModel()),
          ChangeNotifierProvider(create: (_) => AdminInfluencersViewModel()),
          ChangeNotifierProvider(create: (_) => LogoutProfileViewModel()),
          ChangeNotifierProvider(create: (_) => AdminRejectedOrdersViewModel()),
        ],
        child: Builder(builder: (BuildContext context) {
          return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(375, 812),
            // minTextAdapt: true,
            // splitScreenMode: true,
            builder: (context, child) {
              return Consumer<LanguageChangeViewModel>(
                  builder: (context, provider, child) {
                if (locale!.isEmpty) {
                  provider.changeLanguage(Locale('en'));
                }
                return GetMaterialApp(
                    locale: provider.appLocale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    supportedLocales: const [Locale('en'), Locale("pt")],
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
              });
            },
          );
        }));
  }

  Widget _getInitialScreen() {
    if (LocalData.roleId == "1") {
      return const AdminNavBarScreen();
    } else if (LocalData.roleId == "2") {
      return const NavBarScreen();
    } else if (LocalData.roleId == "3") {
      switch (LocalData.status) {
        case "Pending":
          return const PendingAccountScreen();
        case "Active":
          return const InfluencerNavbarScreen();
        case "Cancelled":
          return const AccountRejectedScreen();
        default:
          return const InfluencerNavbarScreen(); // Fallback for undefined status
      }
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
