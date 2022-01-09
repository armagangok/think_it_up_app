import 'package:flutter/material.dart';
import 'package:think_it_up_app/app/views/winners/winner_view.dart';
import './components/export/export.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Wrapper(
      topBar: QuestionWidget(),
      body: [
        SizedBox20H(),
        CommentWidget(),
        SizedBox20H(),
        CommentWidget(),
        SizedBox20H(),
        CommentWidget(),
      ],
      bottomBar: BottomNavigationBar(),
    );
  }
}

Future<dynamic> bottomSheet(BuildContext context) {
  return showModalBottomSheet<dynamic>(
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Padding5(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomContainer(
            heigth: MediaQuery.of(context).size.height * 0.75,
            color: CustomColor().bottomSheet,
            child: Padding5(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const BottomSheetContainer(),
                      const SizedBox5H(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200.0),
                        child: const CustomTextField(),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    text: "Share",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox10H(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: Image.asset("assets/icons/medal.png"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WinnerView(),
                ),
              ),
            ),
            CustomIconButton(
              icon: const Icon(CupertinoIcons.chat_bubble),
              onPressed: () => bottomSheet(context),
            ),
            CustomIconButton(
              icon: const Icon(CupertinoIcons.home),
              onPressed: () {},
            ),
            CustomIconButton(
              icon: const Icon(CupertinoIcons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
