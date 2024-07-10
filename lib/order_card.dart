import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final Map<String, dynamic> order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 140,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 4),
          )],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(order['image'], height: 124, width: 124,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${order['order']} ice cream' ?? 'error',
                style: const TextStyle(
                  fontFamily: 'BalooThambi2',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Text(
                order['sprinkle'] ?? 'no sprinkle',
                style: const TextStyle(
                  fontFamily: 'BalooThambi2',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                order['cone'] ?? 'no cone',
                style: const TextStyle(
                  fontFamily: 'BalooThambi2',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'count ${order['count'].toString()}' ?? 'error',
                style: const TextStyle(
                  fontFamily: 'BalooThambi2',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
