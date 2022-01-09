import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/app/views/dashboard/dashboard.dart';


class WinnerView extends StatelessWidget {
  const WinnerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Wrapper(
      topBar: TopBar(),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class WinnerWidget extends StatelessWidget {
  const WinnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: null,
      child: Padding8(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              userName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox10H(),
            Text("what do you think?"),
            SizedBox10H(),
            Text("Answer: "),
            Text(
              comment,
              style: TextStyle(fontSize: 12.5),
            ),
            SizedBox10H(),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
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
          const Text24B(text: "Winners"),
          Row(
            children: [
              Image.asset(
                "assets/icons/goldMedal.png",
                scale: 4,
              ),
              Image.asset(
                "assets/icons/goldMedal.png",
                scale: 2.5,
              ),
              Image.asset(
                "assets/icons/goldMedal.png",
                scale: 4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
