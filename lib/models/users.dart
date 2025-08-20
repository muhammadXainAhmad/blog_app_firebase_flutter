class UserModel {
  final String uid;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;

  UserModel({
    required this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
  };
}
