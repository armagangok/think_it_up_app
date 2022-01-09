import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/app/views/dashboard/dashboard.dart';

class WinnerView extends StatelessWidget {
  const WinnerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Wrapper(
      topBar: TopBar(),
      body: [],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding8(
      child: CustomContainer(
        heigth: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () => Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashBoardView(),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                children: const [
                  Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
