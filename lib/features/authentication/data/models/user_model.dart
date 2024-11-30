class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String userName;
  final String userEmail;
  final String userPhone;
  final String? userImage;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userId,
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
      'email': userEmail,
      'phone': userPhone,
      'profilePicture': userImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
      userPhone: map['userPhone'] as String,
      userImage: map['userImage'] != null ? map['userImage'] as String : null,
    );
  }
}
