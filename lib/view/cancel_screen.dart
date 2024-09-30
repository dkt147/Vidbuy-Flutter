import 'package:flutter/material.dart';
import 'package:vidbuy_app/resources/componenets/cancel_tile.dart';

class CancelScreen extends StatelessWidget {
  const CancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
