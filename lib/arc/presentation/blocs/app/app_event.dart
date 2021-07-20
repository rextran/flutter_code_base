part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class TokenFirebaseChangeEvent extends AppEvent {
  final String token;
  const TokenFirebaseChangeEvent(this.token);
  @override
  List<Object?> get props => [token];
}

class AppNavigateEvent extends AppEvent {
  final Map<String, dynamic>? data;
  const AppNavigateEvent(this.data);
  @override
  List<Object?> get props => [data];
}

class UserLogoutEvent extends AppEvent {}
