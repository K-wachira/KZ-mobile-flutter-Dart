class UserModel {
  String name;
  String profileURL;
  String iD;
  bool isOpen;
  String documentId;
  UserModel({this.name, this.profileURL, this.iD, this.documentId});

  UserModel.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['vendorName'],
        profileURL = parsedJSON['profilePhotoUrl'],
        documentId = parsedJSON['documentId'],
        isOpen = parsedJSON['open'],
        iD = parsedJSON['vendorID'];
}
