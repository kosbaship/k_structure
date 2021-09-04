import 'package:flutter/material.dart';
import 'package:k_structure/repository/app_repository.dart';

configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppRepository.getInstance;
}
