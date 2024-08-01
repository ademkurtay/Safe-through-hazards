import 'dart:async';

enum NavBarItem { hazard, safety, kit, quiz, settings }

extension StringData on NavBarItem {
  String get fullName =>
      ['Hazard', "Guides", 'ES Kit', 'Quiz', 'Settings'][index];

  String get iconSrc => 'assets/icons/menu/$name.svg';
}

class NavigatorBloc {
  final _navBarController = StreamController<NavBarItem>.broadcast();

  Stream<NavBarItem> get itemStream => _navBarController.stream;
  NavBarItem defaultItem = NavBarItem.hazard;

  void pickItem(NavBarItem item) {
    _navBarController.sink.add(item);
  }

  void dispose() {
    _navBarController.close();
  }
}
