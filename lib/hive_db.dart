import 'package:dessert_delivery_app/ice_cream_model.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDB {
  void initData () async {
    final Box<IceCream> iceCreams = await Hive.openBox('iceCreams');
    final Box<dynamic> userData = await Hive.openBox('userData');
    final Box<Map<String, dynamic>> cards = await Hive.openBox('cards');
    final Box<Map<String, dynamic>> orders = await Hive.openBox('orders');
    if (!userData.containsKey('isFirstRun')) {
      await userData.put('isFirstRun', false,);
      await iceCreams.put('vanilla', IceCream(
        name: 'vanilla',
        price: 4.99,
        description:
        'Vanilla ice cream is beloved for its simplicity and versatility. It pairs well with a variety of toppings and syrups.',
        imagePath: 'assets/images/vanilla.png',
        isFavorite: false,
        popularity: 2,
        orderImagePath: 'assets/images/vanilla_2_image.png',

      ),);
      await iceCreams.put('chocolate', IceCream(
        isFavorite: false,
        popularity: 4,
        name: 'chocolate',
        price: 5.99,
        description:
        'Chocolate ice cream can be enjoyed on its own or with add-ins like chocolate chips, nuts, or caramel.',
        imagePath: 'assets/images/chocolate.png',
        orderImagePath: 'assets/images/chocolate_2_image.png',
      ));
      await iceCreams.put('strawberry', IceCream(
        isFavorite: false,
        popularity: 3,
        name: 'strawberry',
        price: 5.99,
        description:
        'Strawberry ice cream can be enjoyed on its own or with add-ins like chocolate chips, nuts, or caramel.',
        imagePath: 'assets/images/strawberry.png',
        orderImagePath: 'assets/images/strawberry_2_image.png',
      ),);
      await iceCreams.put('pistachio', IceCream(
        isFavorite: false,
        popularity: 1,
        name: 'pistachio',
        price: 5.99,
        description:
        'Often featuring small pieces of pistachio nuts, this ice cream offers a satisfying crunch with every bite.',
        imagePath: 'assets/images/pistachio.png',
        orderImagePath: 'assets/images/pistachio_2_image.png',
      ),);
      print('first run is done');
    }
    print(iceCreams.values.length);
  }

  Future<List<IceCream>> getIceCreamList()  async {
    final Box<IceCream> iceCreams = await Hive.openBox('iceCreams');
    print('${iceCreams.values.length} second time');
    return iceCreams.values.toList();
  }

  Future<void> changeFavoriteState(String name, bool state) async {
    final Box<IceCream> iceCreams = await Hive.openBox('iceCreams');
    var iceCream = iceCreams.get(name);
    iceCream?.isFavorite = state;
    await iceCream?.save();
  }


  void createCard (Map<String, dynamic> card, String name) async {
    final Box<Map<String, dynamic>> cards = await Hive.openBox('cards');
    print('card creating....');
    await cards.add(card);
    print(cards.values.length);

  }

  void createOrder (Map<String, dynamic> order, String name) async {
    final Box<Map<String, dynamic>> orders = await Hive.openBox('orders');
    print('order creating....');
    await orders.add(order);
    print(orders.values.length);

  }

  ValueListenable<Box<Map<String, dynamic>>> getOrders() {
    return Hive.box<Map<String, dynamic>>('orders').listenable();
  }

  Future<List<dynamic>> getCardList() async {
    final Box<Map<String, dynamic>> cards = await Hive.openBox('cards');
    print(cards.values.length);
    return cards.values.toList();
  }

}