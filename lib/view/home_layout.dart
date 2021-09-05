import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:k_structure/shared/app_colors.dart';
import 'package:k_structure/shared/app_enum.dart';
import 'package:k_structure/shared/app_helper_methods.dart';
import 'package:k_structure/shared/app_widgets.dart';
import 'package:k_structure/viewmodels/posts_viewmodel.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseView<PostsViewModel>(
      model: PostsViewModel.getInstance,
      onModelReady: (model) async {
        showSnackBar(
            context: context, massage: '${await model.getConnectionStatus()}');
        model.getPosts();
      },
      builder: (context, model, _) => ConditionalBuilder(
            condition: model.currentState != ViewState.Busy,
            builder: (context) => ConditionalBuilder(
              condition: model.listOfPosts.length != 0,
              builder: (context) => ListView.builder(
                itemCount: model.listOfPosts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CustomText(
                            title: "${model.listOfPosts[index].id}",
                            fontFamily: "Pacifico",
                            fontWeight: FontWeight.normal,
                          ),
                          title: CustomText(
                            title: "${model.listOfPosts[index].title}",
                            fontFamily: "Pacifico",
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                          subtitle: CustomText(
                            title: "${model.listOfPosts[index].body}",
                            fontSize: 12,
                          ),
                        )),
                  );
                },
              ),
              fallback: (context) => Center(
                  child: Text(
                "No data found .. !",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              )),
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              backgroundColor: kWritingColor,
            )),
          ));
}
