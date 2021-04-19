class OrderModel {
  String category;
  String customerID;
  String foodID;
  String foodName;
  String orderStatus;
  String orderTime;
  String quantity;
  String total;
  String vendor;

  OrderModel(
      {this.category,
      this.customerID,
      this.foodID,
      this.foodName,
      this.orderStatus,
      this.orderTime,
      this.quantity,
      this.total,
      this.vendor});

  OrderModel.fromJson(Map<String, dynamic> parsedJSON)
      : category = parsedJSON['category'],
        customerID = parsedJSON['customerID'],
        foodID = parsedJSON['foodID'],
        foodName = parsedJSON['foodName'],
        orderStatus = parsedJSON['orderStatus'],
        orderTime = parsedJSON['orderTime'],
        quantity = parsedJSON['quantity'],
        total = parsedJSON['total'],
        vendor = parsedJSON['vendor'];
}
