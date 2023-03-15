import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:guzergah/home/model/home.dart';

class Client {
  static Stream<HomeModel> readData() async* {
    BaseOptions options = BaseOptions(
      baseUrl: "http://127.0.0.1:5000/agv",
      connectTimeout: Duration(seconds: 2),
      receiveTimeout: Duration(seconds: 2),
    );
    var dio = Dio(options);
    var data = HomeModel();
    var lastData = HomeModel();

    while (true) {
      await Future.delayed(Duration(seconds: 1));
      try {
        var response = await dio.get("http://127.0.0.1:5000/agv");

        data = HomeModel.fromJson(response.data);
        lastData = data;
      } on DioError catch (e) {
        print(e);
      }
      if (lastData != Null) {
        data = lastData;
      }

      yield data;
    }
  }

  static Stream ping() async* {
    BaseOptions options = BaseOptions(
      baseUrl: "http://127.0.0.1:5000/agv",
    );
    var dio = Dio(options);

    while (true) {
      await Future.delayed(Duration(milliseconds: 100));

      try {
        var response = await dio.get("http://127.0.0.1:5000/agv");
        yield true;
      } on DioError catch (e) {
        yield false;
      }
    }
  }
}
