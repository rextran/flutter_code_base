import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/constants/constants.dart';
import '../../../injector.dart';

import '../blocs/blocs.dart';
import '../widgets/widgets.dart';


class ApiView extends StatelessWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(TitlesConstants.apiTitle),
        ),
        body: BlocProvider(
          create: (context) => injector<UserBloc>(),
          child: const ApiMainWidget(),
        ));
  }
}

class ApiMainWidget extends StatelessWidget {
  const ApiMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              context.read<UserBloc>().add(UserApiFetchEvent());
            },
            child: const Text(ButtonConstatns.api)),
        const Expanded(child: UserResultWidget()),
      ]),
    );
  }
}
