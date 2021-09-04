import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:k_structure/data_source/api_helper.dart';
import 'package:k_structure/model/post_model.dart';
import 'package:k_structure/repository/base_repository.dart';
import 'package:k_structure/shared/app_endpoints.dart';

class AppRepository with BaseRepository {
  static AppRepository _instance =
      AppRepository(remoteDataSource: ApiHelper.getInstance);
  static AppRepository get getInstance => _instance;

  final ApiHelper remoteDataSource;
  // final CacheHelper localDataSource;
  // final NetworkInfo networkInfo;

  AppRepository({
    @required this.remoteDataSource,
    // this.localDataSource,
    // this.networkInfo,
  });

  @override
  Future<List<Post>> getPosts() async {
    String resultJSONStringContainsListOfDynamic =
        await remoteDataSource.sendApiRequest(urlWithEndPoint: kPostsService);

    return List<Post>.from(jsonDecode(resultJSONStringContainsListOfDynamic)
        .map((postElement) => Post.fromJson(postElement)));
  }
}
