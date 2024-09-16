
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/navbar_widget.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Consumer<NavbarProvider>(builder: (context, value, child) {
              return screens[value.screen];
            }),
            Positioned(child: NavBar())
          ],
        ));
  }
}