import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Provider/influencer_navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/influencer_navbar.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class InfluencerNavbarScreen extends StatefulWidget {
  const InfluencerNavbarScreen({super.key});

  @override
  State<InfluencerNavbarScreen> createState() => _InfluencerNavbarScreenState();
}

class _InfluencerNavbarScreenState extends State<InfluencerNavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Consumer<InfluencerNavbarProvider>(builder: (context, value, child) {
            // Check if the screen index is valid to avoid any index errors
            if (value.screen < 0 || value.screen >= screens.length) {
              // Optional: You might want to navigate back to login or a default screen
              return LoginScreen(); // or navigate to a safe screen
            }
            return screens[value.screen];
          }),
          Positioned(child: InfluencerNavbar())
        ],
      ),
    );
  }
}
