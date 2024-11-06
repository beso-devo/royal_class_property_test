import 'package:built_value/built_value.dart';

part 'main_page_state.g.dart';

abstract class MainPageState
    implements Built<MainPageState, MainPageStateBuilder> {
  MainPageState._();

  int get currentPageIndex;

  factory MainPageState([Function(MainPageStateBuilder b) updates]) =
      _$MainPageState;

  factory MainPageState.initial() {
    return MainPageState((b) => b..currentPageIndex = 0);
  }
}
