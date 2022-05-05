import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {

 static Dio? dio;

 static init(){

   dio=Dio(BaseOptions(baseUrl:'https://newsapi.org/',
       receiveDataWhenStatusError: true,
   )
   );
 }

   static Future<Response> getData({
   @required String ?Url,
   @required Map<String, dynamic> ?query,
})async
 {
  return await dio!.get(Url!,queryParameters:query );
 }

}




//https://newsapi.org/v2/top-headlines?fbclid=IwAR2SqG9nSaWPJU3RpOAMtq_OB6HJT6RDM2pwMSJ1ORPqy2PfMAS5_heKky4