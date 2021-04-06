import 'package:alu_express_student/services/Models/cart_model.dart';
import 'package:flutter/cupertino.dart';

class CartFunctionality extends ChangeNotifier {
  final List cart = [];

  void addToCart(item) {
    cart.add(item);
  }

  List<CartModel> foodModelList = [];
  List<CartModel> newFoodModelList = [];

  CartModel foodModel;
  List<CartModel> getOrders() {
    cart.forEach((element) {
      foodModel = CartModel(
          foodName: element["FoodName"],
          total: element["Total"],
          vendor: element["Vendor"],
          category: element["Category"],
          customer: element["Customer"],
          orderTime: element["OrderTime"],
          foodID: element["FoodID"],
          orderStatus: element["OrderStatus"]);
      newFoodModelList.add(foodModel);
    });
    return newFoodModelList;

  }

  get throwFoodModelList {
    return foodModelList;
  }
}
