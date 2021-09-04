import 'package:flutter/material.dart';
import 'package:k_structure/shared/app_colors.dart';
import 'package:k_structure/shared/app_configration.dart';
import 'package:k_structure/view/home_layout.dart';

import 'data_source/api_helper.dart';

void main() async {
  await configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: kPrimaryColor),
        home: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'K Structure',
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () =>
                    ApiHelper.getInstance.printNumberOfCreatedObjects,
              )
            ],
          ),
          // go to home layout
          body: HomeScreen(),
        ),
      );
}
