// POST
// UPDATE
// DELETE

// GET
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca



import 'package:dio/dio.dart';

class dioHelper {
static late Dio dio;

 static init () {
   dio = Dio(BaseOptions(baseUrl: "https://newsapi.org/",receiveDataWhenStatusError: true));
 }

 static Future<Response> getDaata ({
   required String url,
   required Map<String,dynamic> query
 }) async {
  return await dio.get(url,queryParameters: query);
 }
}