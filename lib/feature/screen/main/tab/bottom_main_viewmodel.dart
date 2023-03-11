import 'package:arc/arc_subject.dart';
import 'package:callout/feature/viewmodel_interface.dart';

enum BottomState { HOME, CHAT, RANK, MATCH, SETTING }

class BottomMainViewModel implements ViewModelInterface {

  final viewState = ArcSubject<BottomState>();

  @override
  disposeAll() {
    viewState.close();
  }

  @override
  loadState(state) {
    state = state as BottomState;
    viewState.val = state;
  }
}
