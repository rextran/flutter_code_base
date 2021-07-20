import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/constants/constants.dart';
import '../../../injector.dart';

import '../blocs/blocs.dart';
import '../widgets/widgets.dart';


class CachedView extends StatelessWidget {
  const CachedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(TitlesConstants.cachedTitle),
        ),
        body: BlocProvider(
          create: (context) => injector<UserBloc>(),
          child: const CachedMainWidget(),
        ));
  }
}

class CachedMainWidget extends StatelessWidget {
  const CachedMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              context.read<UserBloc>().add(UserLocalFetchEvent());
            },
            child: const Text("Get user Cached")),
        const Expanded(child: UserResultWidget()),
      ]),
    );
  }
}
