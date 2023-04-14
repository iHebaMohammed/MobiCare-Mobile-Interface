import 'package:dio/dio.dart';
import 'package:mobi_care/shared/network/remote/ip_address.dart';

class DioHelper {

  static Dio ? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://$IP4v:4000',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path ,
    Map<String , dynamic> ? queryParameters,
    String ? token,
  }) async{
    return await dio!.get(path , queryParameters: queryParameters );
  }

  static Future<Response> postData ({
    required String url,
    required Map <String , dynamic> data,
    // String ? token,
  }) async{
    return await dio!.post(
        url,
        data: data
    );
  }

  static Future<Response> putData ({
    required String url,
    Map<String , dynamic> ? query,
    required Map <String , dynamic> data,
    String ? token,
  }) async{
    // dio!.options.headers = {
    //   'Content-Type' : 'application/json',
    //   'Authorization' : token,
    // };
    return await dio!.put(
        url,
        queryParameters: query,
        data: data
    );
  }

}
