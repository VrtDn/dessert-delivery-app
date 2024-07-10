import 'package:dessert_delivery_app/filter_widget.dart';
import 'package:dessert_delivery_app/ice_cream_list.dart';
import 'package:dessert_delivery_app/ice_cream_model.dart';
import 'package:dessert_delivery_app/order_widget.dart';
import 'package:dessert_delivery_app/sort_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController();
  final _bannerList = [
    "assets/images/banner2.png",
    "assets/images/banner1.png",
  ];
  String? search;
  bool? isSortByPopularity;
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
            height: 250,
            child: Column(
              children: [
                Filter(callback: (newValues) {
                  setState(() {
                    values = newValues;
                  });
                }),
                SortFilter(
                  isSortByPopularity : isSortByPopularity ?? false,
                  callback: (bool value) {
                   setState(() {
                     isSortByPopularity = value;
                   });
                   print("we sort? $isSortByPopularity");
                  },
                )
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello ${widget.data['username']}!",
                    style: const TextStyle(
                        fontFamily: "BalooThambi", fontSize: 32),
                  ),
                  Image.asset("assets/images/test_profile_image.png")
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                "what do you want today?",
                style: TextStyle(
                  fontFamily: "BalooThambi2",
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _bannerList.length,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _bannerList[index],
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _bannerList.length,
              effect: const ScaleEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: Colors.grey,
                  activeDotColor: Color(0xff7851A1)),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
            const SizedBox(
              height: 35,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                "best choice",
                style: TextStyle(
                  fontFamily: "BalooThambi2",
                  fontSize: 17,
                ),
              ),
            ),
            IceCreamList(
              search: search,
              isSortByPopularity: isSortByPopularity ?? false,
              values: values, isFavoritePage: false,
            )
          ],
        ),
      ),
    );
  }
}
