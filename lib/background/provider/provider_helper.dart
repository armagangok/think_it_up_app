import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../local/viewmodels/switch_provider.dart';

class ProviderHelper {
  List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => SwitchProvider() ),
  
];

}
