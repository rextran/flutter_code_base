
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../src/helper/helpers.dart';
import '../blocs/blocs.dart';
import 'list_user_widget.dart';

class UserResultWidget extends StatelessWidget {
  const UserResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      
      listener: (context, state) {
        if (state is UserLoadingState) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
          if (state is UserFailedState) {
            UiHelper.showMyDialog(
              context: context,
              content: state.message ?? "This is something wrong",
            );
          }
        }
      },

      buildWhen: (previous, current) {
        return (current is UserFetchedState);
      },

      builder: (context, state) {
        final _users = state.appUsers;
        return ListUserWidget(users: _users);
      },
    );
  }
}