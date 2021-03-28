import 'package:flutter/widgets.dart';

class FoodModel {
  final String ImageURL;
  final String FoodName;
  final String Description;
  final String Price;

  FoodModel(
      {@required this.ImageURL,
      @required this.FoodName,
      @required this.Price,
      @required this.Description});
}
