class UserCreationModel {
  String? userID;
  final String firstName;
  final String lastName;
  final String userEmail;
  final String username;
  String password;
  final String userPhone;
  final String? profilePicture;

  UserCreationModel({
    this.userID,
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.username,
    required this.password,
    required this.userPhone,
    this.profilePicture,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'firstName': firstName,
      'lastName': lastName,
      'email': userEmail,
      'username': username,
      'password': password,
      'phone': userPhone,
      'profilePicture': profilePicture ?? '',
    };
  }

  factory UserCreationModel.fromMap(Map<String, dynamic> map) {
    return UserCreationModel(
      userID: map['userID'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      userEmail: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      userPhone: map['phone'] as String,
    );
  }
}
