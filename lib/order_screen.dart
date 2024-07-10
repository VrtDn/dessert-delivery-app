import 'package:dessert_delivery_app/hive_db.dart';
import 'package:dessert_delivery_app/order_card.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'orders Information',
          style: TextStyle(fontFamily: 'BalooThambi'),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/icons/arrow_left_icon.png",
              height: 8,
              width: 8,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveDB().getOrders(),
        builder: (BuildContext context, Box<Map<String, dynamic>> value, Widget? child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: ((context, index) {
              return OrderCard(order: value.getAt(index) ?? {});
            }),
          );
        },
      ),
    );
  }
}
