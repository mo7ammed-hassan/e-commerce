
class UserCreationModel {
  final String firstName;
  final String lastName;
  final String userEmail;
  final String userName;
  final String password;
  final String userPhone;

  UserCreationModel(
    this.firstName,
    this.lastName,
    this.userEmail,
    this.userName,
    this.password,
    this.userPhone,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'userEmail': userEmail,
      'userName': userName,
      'password': password,
      'userPhone': userPhone,
    };
  }

  factory UserCreationModel.fromMap(Map<String, dynamic> map) {
    return UserCreationModel(
      map['firstName'] as String,
      map['lastName'] as String,
      map['userEmail'] as String,
      map['userName'] as String,
      map['password'] as String,
      map['userPhone'] as String,
    );
  }
}
