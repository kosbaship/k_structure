import 'package:flutter/material.dart';
import 'package:k_structure/shared/app_colors.dart';
import 'package:k_structure/shared/app_configuration.dart';
import 'package:k_structure/view/home_layout.dart';
import 'package:provider/provider.dart';

void main() async {
  await configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: kPrimaryColor),
          home: Scaffold(
            backgroundColor: kPrimaryColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'K Structure',
              ),
            ),
            // go to home layout
            body: HomeView(),
          ),
        ),
      );
}
