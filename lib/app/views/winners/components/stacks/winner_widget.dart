import 'package:think_it_up_app/app/core/components/common/widgets/text_widgets.dart';
import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';

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
            Text16(text: "what do you think?"),
            SizedBox10H(),
            Text16(text: userName),
            SizedBox10H(),
            Text14(text: comment),
            SizedBox10H(),
          ],
        ),
      ),
    );
  }
}

