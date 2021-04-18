class UserModel {
  String name;
  String profileURL;
  String ID;

  UserModel({this.name, this.profileURL, this.ID});

  UserModel.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['vendorName'],
        profileURL = parsedJSON['profilePhotoUrl'],
        ID = parsedJSON['vendorID'];
}
