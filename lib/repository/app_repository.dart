import 'dart:convert';

import 'package:k_structure/data_source/api_helper.dart';
import 'package:k_structure/model/post_model.dart';
import 'package:k_structure/repository/base_repository.dart';
import 'package:k_structure/shared/app_endpoints.dart';

class AppRepository with BaseRepository {
  static AppRepository _instance = AppRepository();
  static AppRepository get getInstance => _instance;

  @override
  Future<List<Post>> getPosts() async {
    String resultJSONStringContainsListOfDynamic =
        await ApiHelper.getInstance.sendApiRequest(urlWithEndPoint: kBaseURL);

    return List<Post>.from(jsonDecode(resultJSONStringContainsListOfDynamic)
        .map((postElement) => Post.fromJson(postElement)));
  }
}
