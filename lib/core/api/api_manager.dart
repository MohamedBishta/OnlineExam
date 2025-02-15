import 'package:dio/dio.dart';

class ApiManager{
  static late Dio dio;
  static void init(){
    dio = Dio(
        BaseOptions(baseUrl: "")
    );
  }

  Future<Response> getRequest({required String endpoint,Map<String ,dynamic>? queryParameters}) async {
    var response = await dio.get(endpoint,queryParameters: queryParameters);
    return response;
  }
  Future<Response> postRequest({required String endpoint ,Map<String ,dynamic>? body}) async{
    var response = await dio.post(endpoint,data: body);
    return response;
  }
}