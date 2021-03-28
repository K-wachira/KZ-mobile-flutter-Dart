class VendorModel {
  String foodName;
  String description;
  String discount;
  String imageURL;
  String ingredients;
  String isFeatured;
  String price;
  String size;
  String category;
  String vendor;

  VendorModel(
      {this.foodName,
      this.description,
      this.discount,
      this.imageURL,
      this.ingredients,
      this.isFeatured,
      this.price,
      this.size,
      this.category,
      this.vendor,
      });

  VendorModel.fromJson(Map<String, dynamic> parsedJSON)
      : foodName = parsedJSON['FoodName'],
        description = parsedJSON['Description'],
        discount = parsedJSON['Discount'],
        imageURL = parsedJSON['ImageURL'],
        ingredients = parsedJSON['Ingredients'],
        isFeatured = parsedJSON['IsFeatured'],
        price = parsedJSON['Price'],
        size = parsedJSON['Size'],
        category = parsedJSON['Category'],
        vendor = parsedJSON['Vendor'];

}
