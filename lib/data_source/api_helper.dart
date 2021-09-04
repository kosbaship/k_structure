import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiHelper {
  static ApiHelper _instance = ApiHelper();
  static ApiHelper get getInstance => _instance;
  Dio _dio;

  ApiHelper() {
    _dio = Dio();
    _numberOfCreatedObjects++;
  }

  Future sendApiRequest({
    @required String urlWithEndPoint,
    Map<String, dynamic> requestValues,
    dynamic headers,
  }) async {
    // FormData formData = FormData.fromMap(requestValues);
    Response responseListOfDynamic;

    try {
      // response = await _dio.post(urlWithEndPoint, data: formData);
      responseListOfDynamic = await _dio.get(urlWithEndPoint);
      return jsonEncode(responseListOfDynamic.data);
    } // request
    catch (e) {
      return 'Error: With Requesting the Service | $urlWithEndPoint |. \n===>$e \n';
    }
  }

  int _numberOfCreatedObjects = 0;
  get printNumberOfCreatedObjects =>
      print('Number Of Created Objects is: $_numberOfCreatedObjects');
}
