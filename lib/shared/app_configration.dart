import 'package:flutter/material.dart';
import 'package:k_structure/data_source/api_helper.dart';

configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiHelper.getInstance;
}
