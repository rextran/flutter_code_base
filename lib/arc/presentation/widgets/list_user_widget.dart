import 'package:flutter/material.dart';

import '../../../src/constants/constants.dart';
import '../../data/models/app_user.dart';


class ListUserWidget extends StatelessWidget {
  const ListUserWidget({
    Key? key,
    required List<AppUser>? users,
  }) : _users = users, super(key: key);

  final List<AppUser>? _users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: UIConstants.edgeInsetAll12,
        itemCount: _users?.length ?? 0,
        itemBuilder: (contenxt, index) {
          final _user = _users?[index];
          return UserItemWidget(user: _user);
        });
  }
}

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    Key? key,
    required AppUser? user,
  }) : _user = user, super(key: key);

  final AppUser? _user;

  @override
  Widget build(BuildContext context) {
    return (_user != null) ?
     Container(
      padding: UIConstants.edgeInsetAll12,
      child:  Text(_user!.id + " - " + (_user!.name)),
    )
    : Container();
  }
}