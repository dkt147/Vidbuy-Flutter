import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/cancel_tile.dart';
import 'package:vidbuy_app/view/cancel_request_screen.dart';

class CancelScreen extends StatelessWidget {
  const CancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          navigate(context, CancelRequestScreen());
        },
        child: Column(
          children: [
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
            CancelTile(),
          ],
        ),
      ),
    );
  }
}
