import 'package:dessert_delivery_app/hive_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_creation_screen.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: HiveDB().getCardList(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                print('null again');

                return const SizedBox(
                  height: 100,
                );
              }
              var data = snapshot.data;
              print(data!.length);
              return ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 270,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset("assets/images/card_image.png"),
                        Column(
                          children: [
                            const SizedBox(height: 90,),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                data[index]['number'],
                                style: const TextStyle(
                                    fontFamily: 'BalooThambi', fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 90,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${data[index]['first']} ${data[index]['last']}",
                                  style: const TextStyle(
                                      fontFamily: 'BalooThambi', fontSize: 12.85),
                                ),
                                Text(
                                  data[index]['date'],
                                  style: const TextStyle(
                                      fontFamily: 'BalooThambi', fontSize: 12.85),
                                ),
                                const SizedBox(width: 90,),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: const Color(0xff7851A1),
              maxRadius: 37.5,
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 45,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CardInfoScreen(
                            callback: () {
                              setState(() {});
                            },
                          )));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
