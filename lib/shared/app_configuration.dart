import 'package:flutter/material.dart';
import 'package:k_structure/repository/app_repository.dart';
import 'package:k_structure/viewmodels/posts_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppRepository.getInstance;
}

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider(create: (_) => PostsViewModel.getInstance),
];

List<SingleChildWidget> dependentServices = [
  // ProxyProvider let's you pass values
  // from one provided model to another or
  // ProxyProvider is used here to define services
  // that need to rely on other Providers
];
