import 'package:arc/arc_subject.dart';
import 'package:callout/feature/viewmodel_interface.dart';


enum LoginViewState { START, LOGIN_COMPLETED, LOGIN_ERROR, LOGIN_FAILED }

class EmailLoginViewModel implements ViewModelInterface {

  final viewState = ArcSubject<LoginViewState>();

  var idText = "".sbj;
  var pwText = "".sbj;

  onChangedId(String str) => idText.val = str;
  onChangedPw(String str) => pwText.val = str;

  @override
  disposeAll() {
    viewState.close();
  }

  @override
  loadState(state) {
    state = state as LoginViewState;
    viewState.val = state;
  }
}
