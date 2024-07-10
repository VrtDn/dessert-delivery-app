import 'package:dessert_delivery_app/hive_db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'ice_cream_card.dart';
import 'ice_cream_model.dart';
import 'order_widget.dart';

class IceCreamList extends StatefulWidget {
  IceCreamList({
    super.key,
    this.search,
    this.isSortByPopularity,
    this.values,
    required this.isFavoritePage,
  });

  final String? search;
  final bool? isSortByPopularity;
  final RangeValues? values;
  final bool isFavoritePage;

  @override
  State<IceCreamList> createState() => _IceCreamListState();
}


// if (snapshot.data == null) {
//   print("data is null");
//   return CircularProgressIndicator();
// }
// var data = snapshot.data;
// if (widget.isSortByPopularity != null &&
//     widget.isSortByPopularity == true) {
//   data!.sort((a, b) => a.popularity.compareTo(b.popularity));
// } else {
//   data!.sort((a, b) => b.popularity.compareTo(a.popularity));
// }

class _IceCreamListState extends State<IceCreamList> {
  HiveDB hiveDB = HiveDB();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: hiveDB.getIceCreamList(),
      builder: (context, snapshot) {
        List<IceCream> data = snapshot.data ?? [];
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var currentIC = data[index];
            if (widget.isFavoritePage == true &&
                currentIC.isFavorite == false) {
              return SizedBox();
            }
            if (widget.search != null &&
                !currentIC.name.startsWith(widget.search!)) {
              return SizedBox();
            }
            if (widget.values != null &&
                (currentIC.price > widget.values!.end ||
                    currentIC.price < widget.values!.start)) {
              return SizedBox();
            }
            return IceCreamCard(
              iceCream: currentIC,
              callback: () async {
                HiveDB().changeFavoriteState(
                    data[index].name, !data[index].isFavorite);
                setState(() {});
              },
            );
          },
        );
      },
    );
  }
}
