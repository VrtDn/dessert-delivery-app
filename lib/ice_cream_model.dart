import 'package:hive/hive.dart';

part 'ice_cream_model.g.dart';
@HiveType(typeId: 0)
class IceCream extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String imagePath;
  @HiveField(4)
  bool isFavorite;
  @HiveField(5)
  final int popularity;
  @HiveField(6)
  final String orderImagePath;

  IceCream( {
    required this.orderImagePath,
    required this.isFavorite,
    required this.popularity,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}