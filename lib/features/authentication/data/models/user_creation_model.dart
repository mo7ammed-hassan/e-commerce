class UserCreationModel {
  String? userID;
  final String firstName;
  final String lastName;
  final String userEmail;
  final String username;
  String? password;
  final String userPhone;
  final String? profilePicture;

  UserCreationModel({
    this.userID,
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.username,
    this.password,
    required this.userPhone,
    this.profilePicture,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userID,
      'firstName': firstName,
      'lastName': lastName,
      'email': userEmail,
      'username': username,
      // 'password': password, i can't store password
      'phone': userPhone,
      'profilePicture': profilePicture ?? '',
    };
  }
}
