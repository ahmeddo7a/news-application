import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio= Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future getData({required String url, required dynamic query}) async{
   return await dio.get(url,queryParameters: query,);

  }
}