part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState(this.appUsers);
  final List<AppUser>? appUsers;

  @override
  List<Object?> get props => [appUsers];
}

class UserInitialState extends UserState {
  const UserInitialState() : super(null);
}

class UserLoadingState extends UserState {
  const UserLoadingState(List<AppUser>? appUsers) : super(appUsers);
}

class UserFetchedState extends UserState {
  const UserFetchedState(List<AppUser>? appUsers) : super(appUsers);
}

class UserFailedState extends UserState {
  final String? message;
  const UserFailedState(this.message, List<AppUser>? appUsers)
      : super(appUsers);
}
