import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';

class TopBar extends StatelessWidget {
  final String text;
  final Widget? icons;

  const TopBar({
    Key? key,
    required this.text,
    this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      heigth: 70,
      child: Padding8(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icons ?? const SizedBox(),
            Text24B(text: text),
            icons ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

     // CustomIconButton(
          //   icon: const Icon(CupertinoIcons.back),
          //   onPressed: () => Navigator.pop(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const DashBoardView(),
          //     ),
          //   ),
          // ),