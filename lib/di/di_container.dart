import 'package:callout/feature/screen/main/tab/bottom_main_viewmodel.dart';
import 'package:get_it/get_it.dart';

final it = GetIt.instance;

Future<void> setupModule() async {
  //factory viewModel
  it.registerFactory(() => BottomMainViewModel());
}
