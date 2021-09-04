import 'package:flutter/material.dart';
import 'package:k_structure/data_source/api_helper.dart';
import 'package:k_structure/repository/app_repository.dart';

configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiHelper.getInstance;
  AppRepository.getInstance;
}
