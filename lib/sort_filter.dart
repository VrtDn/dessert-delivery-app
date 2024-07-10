import 'package:flutter/material.dart';

class SortFilter extends StatefulWidget {
   SortFilter({super.key, required this.callback, required this.isSortByPopularity});
  final Function(bool) callback;
  bool isSortByPopularity;
  @override
  State<SortFilter> createState() => _SortFilterState();
}

class _SortFilterState extends State<SortFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Sort by popularity',
          style: TextStyle(fontSize: 20, fontFamily: "BalooThambi"),
        ),
        Checkbox(
          shape: CircleBorder(),
            value: widget.isSortByPopularity ?? false,
            activeColor: Color(0xff7851A1),
            // checkColor: Colors.grey,
            onChanged: (newValue) {
              print(newValue);
              setState(() {
                widget.isSortByPopularity = newValue!;
              });
              widget.callback(newValue!);
            })
      ],
    );
  }
}
