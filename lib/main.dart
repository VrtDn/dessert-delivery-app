import 'package:dessert_delivery_app/ice_cream_model.dart';
import 'package:dessert_delivery_app/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'hive_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(IceCreamAdapter());
  HiveDB dB = HiveDB();
  dB.initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dessert delivery app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SingIn(),
    );
  }
}

