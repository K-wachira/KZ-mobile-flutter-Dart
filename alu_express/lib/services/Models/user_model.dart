class UserModel {
  String name;
  String profileURL;
  String iD;
  bool isOpen;

  UserModel({this.name, this.profileURL, this.iD});

  UserModel.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['vendorName'],
        profileURL = parsedJSON['profilePhotoUrl'],
                isOpen = parsedJSON['open'],

        iD = parsedJSON['vendorID'];

}
