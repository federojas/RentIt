class UserModel {
  String email;
  String firstName;
  String lastName;
  String age;
  String phoneNumber;

  UserModel({this.email, this.firstName, this.lastName, this.age, this.phoneNumber});

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      phoneNumber: map['phoneNumber']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'phoneNumber': phoneNumber
    };
  }
}