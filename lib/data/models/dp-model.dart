class FriendContact {
  int? id;
  String? name;
  String? phoneNumber;
  String? address;

  FriendContact({this.id, this.name, this.address, this.phoneNumber});

  factory FriendContact.fromjson(Map<String, dynamic> json) {
    return FriendContact(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
    );
  }
  Map<String,dynamic>toMap()
  {
    return {
      'id':id,
      'name':name,
      'phoneNumber':phoneNumber,
      'address':address,
    };
  }
}
