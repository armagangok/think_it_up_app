import 'package:flutter/material.dart';
import './components/export/export.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomPadding(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: QuestionWidget(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  SizedBox20H(),
                  CommentWidget(),
                  SizedBox20H(),
                  CommentWidget(),
                  SizedBox20H(),
                  CommentWidget(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox10H(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(
                    icon: Image.asset("assets/icons/medal.png"),
                    onPressed: () {},
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
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      context: context,
      builder: (context) => CustomPadding(
        child: Container(
          color: CustomColor().bottomSheet,
          height: 700,
          child: CustomPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    BottomSheetContainer(),
                    SizedBox10H(),
                    CustomTextField(),
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
    );
  }
}
