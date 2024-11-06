
abstract class MainPageEvent {}

class PageChanged  extends MainPageEvent {
  final int index;

  PageChanged(this.index);
}