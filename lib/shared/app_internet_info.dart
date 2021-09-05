import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class InternetConnectionHelper {
  static InternetConnectionHelper _instance = InternetConnectionHelper();
  static InternetConnectionHelper get getInstance => _instance;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  getConnectivity() async {
    try {
      _connectionStatus = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
    return _connectionStatus;
  }
}
