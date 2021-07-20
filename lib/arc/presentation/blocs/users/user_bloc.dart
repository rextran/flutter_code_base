import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../src/core/resources/data_state.dart';
import '../../../data/local_db/daos/app_user_dao.dart';
import '../../../data/models/app_user.dart';
import '../../../data/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userSevice, this._userDao) : super(const UserInitialState());

  final UserSevice _userSevice;
  final AppUserDao _userDao;

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserApiFetchEvent) {
      yield UserLoadingState(state.appUsers);
      yield await _mapUserApiFetchToState();
    }
    if (event is UserLocalFetchEvent) {
      yield UserLoadingState(state.appUsers);
      yield await _mapUserLocalFetchToState();
    }
  }

  // Transform functions
  Future<UserState> _mapUserApiFetchToState() async {
    final _result = await _userSevice.getUsers();
    if (_result is DataSuccess) {
      _saveUserToLocal(_result.data);
      return UserFetchedState(_result.data);
    } else {
      return UserFailedState(_result.error?.message, state.appUsers);
    }
  }

  Future<UserState> _mapUserLocalFetchToState() async {
    try {
      final _result = await _userDao.findAllAppUsers();
      return UserFetchedState(_result);
    } catch (e) {
      return UserFailedState(e.toString(), state.appUsers);
    }
  }

  // Other business functions
  Future<void> _saveUserToLocal(List<AppUser>? users) async {
    if (users == null) return;
    await _deleteLocalUsers(users);
    await _userDao.insertAppUser(users);
  }

  Future<void> _deleteLocalUsers(List<AppUser> users) async {
    await _userDao.deleteAppUser(users);
  }
}
