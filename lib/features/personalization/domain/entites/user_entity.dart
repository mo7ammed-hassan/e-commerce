class UserEntity {
  final String? userId;
  final String firstName;
  final String lastName;
  final String username;
  final String userEmail;
  final String userPhone;
  final String? profilePicture;

  UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.userEmail,
    required this.userPhone,
    required this.profilePicture,
  });
}
