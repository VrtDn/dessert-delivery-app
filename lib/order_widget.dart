import 'package:dessert_delivery_app/hive_db.dart';
import 'package:dessert_delivery_app/ice_cream_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.iceCream});

  final IceCream iceCream;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  int orderCounter = 1;
  String? sprinkle;
  List<String> sprinkles = [
    'none','oreo', 'nuts', 'classic'
  ];
  bool isOrderInCone = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 530,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.iceCream.orderImagePath,
                  height: 128,
                  width: 128,
                ),
                Column(
                  children: [
                    Container(
                      width: 220,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.iceCream.name} ice cream",
                        style: const TextStyle(
                          fontFamily: 'BalooThambi2',
                          fontSize: 24,
                        ),
                        maxLines: 20,
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        widget.iceCream.description,
                        maxLines: 20,
                        style: const TextStyle(
                          fontFamily: 'BalooThambi2',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 53,
                  width: 118,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff7851A1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (orderCounter > 1) {
                                orderCounter -= 1;
                              }
                            });
                          },
                          child: const Text(
                            '-',
                            style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'BalooThambi',
                                color: Colors.white),
                          )),
                      Text(
                        orderCounter.toString(),
                        style: const TextStyle(
                            fontSize: 36,
                            fontFamily: 'BalooThambi',
                            color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (orderCounter < 10) {
                                orderCounter += 1;
                              }
                              ;
                            });
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'BalooThambi',
                                color: Colors.white),
                          )),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor:
                      widget.iceCream.isFavorite ? Colors.red : Colors.white,
                  child: Icon(
                    Icons.favorite_outline,
                    color: widget.iceCream.isFavorite
                        ? Colors.white
                        : Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(height: 55),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'sprinkles',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'BalooThambi2',
                      color: Colors.black),
                ),
                Row(
                  children: [
                     Text(
                      sprinkle ?? 'none',
                      style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'BalooThambi2',
                          color: Colors.black),
                    ),
                    PopupMenuButton<int>(
                      onSelected: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          if (value != 0) {
                            sprinkle = sprinkles[value];
                          } else {
                            sprinkle = null;
                          }

                        });
                        print("Selected value: ${sprinkles[value]}");
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text("none"),
                        ),
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text("oreo"),
                        ),
                        const PopupMenuItem<int>(
                          value: 2,
                          child: Text("nuts"),
                        ),
                        const PopupMenuItem<int>(
                          value: 3,
                          child: Text("classic"),
                        ),
                      ],
                      icon: Image.asset('assets/icons/arrow_button_icon.png', width: 24, height: 24,), // Иконка, по которой вызывается PopupMenu
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 55),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'order in cone',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'BalooThambi2',
                      color: Colors.black),
                ),
                Checkbox(
                    shape: CircleBorder(),
                    value: isOrderInCone,
                    activeColor: Color(0xff7851A1),
                    // checkColor: Colors.grey,
                    onChanged: (newValue) {
                      print(newValue);
                      setState(() {
                        isOrderInCone = newValue!;
                      });
                    })
              ],
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: (){
                HiveDB().createOrder({
                  'count' : orderCounter,
                  'sprinkle' : sprinkle,
                  'image' : widget.iceCream.orderImagePath,
                  'order' : widget.iceCream.name,
                  'cone' : isOrderInCone
                }, 'name');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff7851A1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 60.0),
              ),
              child: const Text(
                'order',
                style: TextStyle(
                  fontFamily: 'BalooThambi',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
