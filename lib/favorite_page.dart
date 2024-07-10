import 'package:dessert_delivery_app/ice_cream_list.dart';
import 'package:dessert_delivery_app/sort_filter.dart';
import 'package:flutter/material.dart';

import 'filter_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String? search;
  RangeValues? values;
  final _searchController = TextEditingController();
  void _showMyDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text(
            'Price range',
            style: TextStyle(fontSize: 20, fontFamily: "BalooThambi"),
          ),
          content: SizedBox(
            width: 150,
            height: 150,
            child: Column(
              children: [
                Filter(callback: (newValues) {
                  setState(() {
                    values = newValues;
                  });
                }),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16, left: 16, top: 36),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: const Text(
                "your favorite",
                style: TextStyle(
                  fontFamily: "BalooThambi2",
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 52,
                    width: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      onChanged: (String value) {
                        setState(() {
                          search = value;
                        });
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: "search",
                        hintStyle: TextStyle(
                            fontFamily: 'BalooThambi2',
                            color: Colors.black,
                            fontSize: 24),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                      ),
                      style: const TextStyle(
                        fontFamily: 'BalooThambi2',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showMyDialog(context);
                    },
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                          color: const Color(0xff7851A1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset("assets/icons/filter_icon.png"),
                    ),
                  )
                ],
              ),
            ),
            IceCreamList(
              search: search,
              values: values, isFavoritePage: true,
            )
          ],
        ),
      ),
    );
  }
}
