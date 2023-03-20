import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/export/core_export.dart';
import '../../../winners/presentation/widgets/top_bar.dart';
import '../widgets/stacks.dart';
import '../widgets/switch_widget.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  final _authViewModel = getit.get<AuthViewModel>();
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      topBar: const TopBar(text: "Settings"),
      body: SizedBox(
        height: MediaQuery.of(context).size.longestSide,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingItem(
                text: 'Edit profile',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Change password',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Push notification',
                onPressed: () {},
                icon: SwitchWidget(
                  switchProvider: NotificationProvider(),
                ),
              ),
              SettingItem(
                text: 'Dark mode',
                onPressed: () {},
                icon: SwitchWidget(
                  switchProvider: ThemeProvider(),
                ),
              ),
              SettingItem(
                text: 'Get premium',
                onPressed: () {},
              ),
              const Divider(),
              const Padding5(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("More"),
                ),
              ),
              SettingItem(
                text: 'About us',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Privacy & Policy',
                onPressed: () {},
              ),
              SettingItem(
                text: 'Terms & Co',
                onPressed: () {},
              ),
              _logoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) => SettingItem(
        text: 'Logout',
        onPressed: () async {
          await _authViewModel.logout(
            ref.read(homeViewModel),
          );

          ref.watch(authViewModel).logoutState.when(
                initial: () {},
                loading: () {},
                completed: (data) {
                  context.showSnackBar(
                    const SnackBar(
                      content: Text("Logout succesfull"),
                    ),
                  );
                },
                failed: (failure) {
                  context.showSnackBar(
                    SnackBar(
                      content: Text(failure.message),
                    ),
                  );
                },
              );
        },
      );
}
