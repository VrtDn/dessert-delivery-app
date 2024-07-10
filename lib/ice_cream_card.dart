import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ice_cream_model.dart';
import 'order_widget.dart';

class IceCreamCard extends StatefulWidget {
  IceCreamCard({super.key, required this.iceCream, required this.callback});
  final IceCream iceCream;
  final Function() callback;
  @override
  State<IceCreamCard> createState() => _IceCreamCardState();
}

class _IceCreamCardState extends State<IceCreamCard> {

  void _showOrderMenu (BuildContext context, IceCream iC) {
    showBottomSheet(context: context, builder: (ctx) => OrderWidget(iceCream: iC));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          SizedBox(width: double.infinity, height: 164,),
          Column(
            children: [
              SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                height: 128,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  )],
                  borderRadius: BorderRadius.circular(28)
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 130),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.iceCream.name,
                                style: const TextStyle(
                                  fontFamily: "BalooThambi2",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.iceCream.price.toStringAsFixed(2)} \$',
                                style: const TextStyle(
                                  fontFamily: "BalooThambi",
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.iceCream.description,
                            style: const TextStyle(
                                fontSize: 14,
                              fontFamily: "BalooThambi2",

                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Image.asset(
            widget.iceCream.imagePath,
            width: 150,
            height: 150,
            alignment: Alignment.topLeft,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: widget.iceCream.isFavorite ? Colors.red : Colors.white ,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, size: 24, color: widget.iceCream.isFavorite ? Colors.white : Colors.black,),
                    onPressed: () {
                      print("dd");
                      widget.callback();
                    },
                  ),
                ),
                const SizedBox(width: 5,),
                CircleAvatar(
                  backgroundColor: const Color(0xff7851A1),
                  child: IconButton(
                    icon: const Icon(Icons.add, size: 24, color: Colors.white,),
                    onPressed: (){
                      _showOrderMenu(context, widget.iceCream);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
