import 'package:flutter/widgets.dart';

class Content extends StatelessWidget {
  String data;
  double size;
  Color? color;
  int? maxLines;
  FontWeight? weight;
  TextAlign? alignment;
  TextDecoration? decoration;
  String? family;

  Content(
      {required this.data,
      required this.size,
      this.color,
      this.maxLines,
      this.decoration,
      this.weight,
      this.alignment,
      this.family});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: alignment,
      maxLines: maxLines ?? 100,
      style: TextStyle(
          decoration: decoration,
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontFamily: family,
          overflow: TextOverflow.ellipsis),
    );
  }
}
