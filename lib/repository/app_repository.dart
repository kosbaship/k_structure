import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:k_structure/datasource/api_helper.dart';
import 'package:k_structure/datasource/cache_helper.dart';
import 'package:k_structure/model/post_model.dart';
import 'package:k_structure/repository/base_repository.dart';
import 'package:k_structure/shared/app_endpoints.dart';
import 'package:k_structure/shared/app_internet_info.dart';
import 'package:k_structure/shared/app_strings.dart';

class AppRepository with BaseRepository {
  static AppRepository _instance = AppRepository(
    remoteDataSource: ApiHelper.getInstance,
    localDataSource: CacheImplementation.getCacheInstance,
    networkInfo: InternetConnectionHelper.getInstance,
  );

  static AppRepository get getInstance => _instance;

  final ApiHelper remoteDataSource;
  final CacheHelper localDataSource;
  final InternetConnectionHelper networkInfo;

  AppRepository({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<List<Post>> getPosts() async {
    print('==============================');
    print('${await networkInfo.getConnectivity()}');
    print('==============================');
    if (await networkInfo.getConnectivity() != ConnectivityResult.none) {
      String resultJSONStringContainsListOfDynamic =
          await remoteDataSource.sendApiRequest(urlWithEndPoint: kPostsService);

      await localDataSource.put(
          kSharedPrefPostsKey, resultJSONStringContainsListOfDynamic);

      return List<Post>.from(jsonDecode(resultJSONStringContainsListOfDynamic)
          .map((postElement) => Post.fromJson(postElement)));
    } else {
      var localPostsSavedAsString =
          await localDataSource.get(kSharedPrefPostsKey);

      return List<Post>.from(jsonDecode(localPostsSavedAsString.toString())
          .map((postElement) => Post.fromJson(postElement)));
    }
  }
}
