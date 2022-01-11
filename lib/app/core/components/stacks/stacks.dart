import 'package:flutter/material.dart';


class CommonWrapperWidget extends StatelessWidget {
  final Widget child;
  const CommonWrapperWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
