import 'package:flutter/material.dart';
import 'package:think_it_up_app/core/components/common/alignment/alignment.dart';


class AuthWrapper extends StatelessWidget {
  final Widget child;
  final PreferredSize? appBar;
  const AuthWrapper({
    Key? key,
    required this.child,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: appBar,
          body: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: Padding8(
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
