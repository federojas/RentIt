class UserModel {
  String email;
  String firstName;
  String lastName;
  String age;

  UserModel({this.email, this.firstName, this.lastName, this.age});

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }
}