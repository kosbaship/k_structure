import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:k_structure/model/post_model.dart';
import 'package:k_structure/repository/app_repository.dart';
import 'package:k_structure/shared/app_colors.dart';
import 'package:k_structure/shared/app_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> listOfPosts = <Post>[];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  getPosts() async {
    listOfPosts = await AppRepository.getInstance.getPosts();
    setState(() => isLoading = true);
  }

  @override
  Widget build(BuildContext context) => ConditionalBuilder(
        condition: isLoading,
        builder: (context) => ConditionalBuilder(
          condition: listOfPosts.length != 0,
          builder: (context) => ListView.builder(
            // modify the list length
            itemCount: listOfPosts.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // this a good structure for a list item
                    child: ListTile(
                      // one
                      leading: CustomText(
                        title: "${listOfPosts[index].id}",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //two
                      title: CustomText(
                        title: "${listOfPosts[index].title}",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //three
                      subtitle: CustomText(
                        title: "${listOfPosts[index].body}",
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
      );
}
