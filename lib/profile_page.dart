import 'dart:ffi';

import 'package:dessert_delivery_app/order_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/profile_top.png",
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 72),
                  child: Center(
                    child: SizedBox(
                      height: 128,
                      width: 128,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            foregroundImage: AssetImage(
                                "assets/images/test_profile_image.jpg"),
                            maxRadius: 64,
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                "assets/images/photo_image.png",
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.data["username"],
                style: const TextStyle(
                    fontFamily: "BalooThambi",
                  fontSize: 32
                ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit, color: Color(0xff7851A1)))
            ],
          ),
          const SizedBox(height: 5,),
          Text(
            widget.data["email"],
            style: const TextStyle(
                fontFamily: "BalooThambi2",
                fontSize: 20
            ),
          ),
          const SizedBox(height: 18,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: const Text(
              "My account",
              style: TextStyle(
                  fontFamily: "BalooThambi",
                  fontSize: 24
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                )
              ]
            ),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "personal information",
                    style: TextStyle(
                        fontFamily: "BalooThambi2",
                        fontSize: 24
                    ),
                  ),
                  trailing: Image.asset("assets/icons/arrow_right_icon.png", height: 24, width: 24,),
                  leading: Image.asset("assets/icons/lock_icon.png"),
                  contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 64, right: 64),
                  child: Divider(

                  ),
                ),
                ListTile(
                  onTap: (){},
                  title: const Text(
                    "notifications",
                    style: TextStyle(
                        fontFamily: "BalooThambi2",
                        fontSize: 24
                    ),
                  ),
                  trailing: Image.asset("assets/icons/arrow_right_icon.png", height: 24, width: 24,),
                  leading: Image.asset("assets/icons/bell_icon.png", height: 24, width: 24),
                  contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 64, right: 64),
                  child: Divider(

                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const OrderScreen())
                    );
                  },
                  title: const Text(
                    "orders",
                    style: TextStyle(
                        fontFamily: "BalooThambi2",
                        fontSize: 24
                    ),
                  ),
                  trailing: Image.asset("assets/icons/arrow_right_icon.png", height: 24, width: 24,),
                  leading: Image.asset("assets/icons/map_icon.png", height: 24, width: 24),
                  contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            width: double.infinity,
            child: const Text(
              "legal information",
              style: TextStyle(
                  fontFamily: "BalooThambi",
                  fontSize: 20
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  )
                ]
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: (){},
                  title: const Text(
                    "terms and conditions",
                    style: TextStyle(
                        fontFamily: "BalooThambi2",
                        fontSize: 24
                    ),
                  ),
                  trailing: Image.asset("assets/icons/arrow_right_icon.png", height: 24, width: 24,),
                  leading: Image.asset("assets/icons/lock_icon.png"),
                  contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 64, right: 64),
                  child: Divider(

                  ),
                ),
                ListTile(
                  onTap: (){},
                  title: const Text(
                    "privacy policy",
                    style: TextStyle(
                        fontFamily: "BalooThambi2",
                        fontSize: 24
                    ),
                  ),
                  trailing: Image.asset("assets/icons/arrow_right_icon.png", height: 24, width: 24,),
                  leading: Image.asset("assets/icons/bell_icon.png", height: 24, width: 24),
                  contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
