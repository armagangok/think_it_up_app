import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/export/core_export.dart';

class RootPage extends ConsumerStatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(homeViewModel).currentUserState.when(
      initial: () {
        return const Text("");
      },
      loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
      completed: (data) {
        if (data != null) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
      failed: (failure) {
        return Text(failure.message);
      },
    );
  }
}
