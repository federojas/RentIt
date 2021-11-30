class UserModel {
  String email;
  String firstName;
  String lastName;
  String address;
  String phoneNumber;
  String image;
  UserModel({this.email, this.firstName, this.lastName, this.address, this.phoneNumber, this.image});

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
      image: map['image']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'phoneNumber': phoneNumber,
      'image': image
    };
  }
}