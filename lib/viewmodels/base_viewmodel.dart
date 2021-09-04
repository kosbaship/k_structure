import 'package:flutter/foundation.dart';
import 'package:k_structure/shared/app_enum.dart';

class BaseViewModel extends ChangeNotifier {
  bool _disposed = false;

  ViewState _state = ViewState.Idle;
  ViewState get currentState => _state;
  set changeState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }
}
