import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.maxValue,
  });

  final double initialValue;
  final void Function(double) onChanged;
  final double maxValue;

  @override
  _PriceSliderState createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  double _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return 
 Container(
  // width: 169.w,
  // height: 55.h,
   child: Row(
        children: 
   [
          DropdownButton<String>(
            value: 'Sort by',
            items: ['Sort by', 'Price', 'Date', 'Popularity'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Implement dropdown logic   
   //  here
            },
          ),
          // Expanded(
          //   child: Slider(
          //     value: _value,
          //     min: 0,
          //     max: widget.maxValue,
          //     divisions: 100,
          //     onChanged: (double value) {
          //       setState(() {
          //         _value = value;
          //       });
          //       widget.onChanged(value);
          //     },
          //   ),
          // ),
          Text('€${_value.toStringAsFixed(2)}'),
          const Text('Max price'),
        ],
      ),
 );
  }
}