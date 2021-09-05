import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:k_structure/model/post_model.dart';
import 'package:k_structure/repository/app_repository.dart';
import 'package:k_structure/shared/app_enum.dart';
import 'package:k_structure/shared/app_internet_info.dart';

import 'base_viewmodel.dart';

class PostsViewModel extends BaseViewModel {
  static PostsViewModel _instance = PostsViewModel();

  static PostsViewModel get getInstance => _instance;

  List<Post> listOfPosts = <Post>[];

  Future<void> getPosts() async {
    changeState = ViewState.Busy;
    listOfPosts = await AppRepository.getInstance.getPosts();
    changeState = ViewState.Idle;
  }

  getConnectionStatus() async {
    switch (await InternetConnectionHelper.getInstance.getConnectivity()) {
      case ConnectivityResult.none:
        return 'No Internet Connected';
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return 'Internet Connected Successfully';
    }
  }
}
