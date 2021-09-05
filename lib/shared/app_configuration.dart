import 'package:flutter/material.dart';
import 'package:k_structure/datasource/cache_helper.dart';
import 'package:k_structure/repository/app_repository.dart';
import 'package:k_structure/viewmodels/posts_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheImplementation.initCacheInstance(await SharedPreferences.getInstance());
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
