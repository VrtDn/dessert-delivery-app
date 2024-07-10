import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ice_cream_model.dart';

class Filter extends StatefulWidget {
  Filter({super.key, required this.callback});

  final Function(RangeValues) callback;
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues values = const RangeValues(1.0, 15.0);

  @override
  Widget build(BuildContext context) {
    var labels = RangeLabels(
        values.start.round().toString(), values.end.round().toString());
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labels.start,
                style: TextStyle(fontSize: 20, fontFamily: "BalooThambi2"),
              ),
              Container(
                color: Colors.black,
                width: 20,
                height: 3,
              ),
              Text(
                labels.end,
                style: TextStyle(fontSize: 20, fontFamily: "BalooThambi2"),
              )
            ],
          ),
          RangeSlider(
            max: 15,
            min: 1,
            values: values,
            labels: labels,
            inactiveColor: Colors.grey,
            activeColor: Color(0xff7851A1),
            onChanged: (newValues) {
              setState(() {
                values = newValues;
              });
              widget.callback(newValues);
            },
          ),
        ],
      ),
    );
  }
}
