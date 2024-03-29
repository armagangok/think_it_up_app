import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../widgets/top_bar.dart';
import '../widgets/winner_widget.dart';

class WinnerPage extends StatelessWidget {
  const WinnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      topBar: TopBar(
        text: "Winners",
        icons: Row(
          children: [
            Image.asset("assets/icons/goldMedal.png", scale: 4),
            Image.asset("assets/icons/goldMedal.png", scale: 2.5),
            Image.asset("assets/icons/goldMedal.png", scale: 4),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox10H(),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text24B(text: "Winner Of The Day"),
            ),
            SizedBox10H(),
            WinnerWidget(),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text24B(text: "Winners Of The All Times"),
            ),
            SizedBox10H(),
            WinnerWidget(),
            SizedBox10H(),
            WinnerWidget(),
            SizedBox10H(),
          ],
        ),
      ),
    );
  }
}
