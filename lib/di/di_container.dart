import 'package:callout/feature/screen/main/login/email_login_viewmodel.dart';
import 'package:callout/feature/screen/main/tab/bottom_main_viewmodel.dart';
import 'package:get_it/get_it.dart';

final it = GetIt.instance;

Future<void> setupModule() async {
  //factory viewModel
  it.registerFactory(() => BottomMainViewModel());
  it.registerFactory(() => EmailLoginViewModel());


}
