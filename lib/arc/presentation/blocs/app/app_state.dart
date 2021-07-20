part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

class AppInitial extends AppState {}

class AppNavigateState extends AppState {
  final Map<String, dynamic>? data;
  const AppNavigateState(this.data);
  @override
  List<Object?> get props => [data];
}

class UserLogoutState extends AppState{}
