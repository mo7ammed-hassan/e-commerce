abstract class DeleteUserAccountState {}

class DeleteUserAccountInitialState extends DeleteUserAccountState {}

class DeleteUserAccountLoading extends DeleteUserAccountState {}

class DeleteUserAccountSuccess extends DeleteUserAccountState {}

class DeleteUserAccountFailure extends DeleteUserAccountState {}

class ReAuthUserState extends DeleteUserAccountState {}
