import 'package:dio/dio.dart';
import 'package:online_exam/core/constants.dart';

class ApiManager{
  static late Dio dio;
  static void init(){
    dio = Dio(
        BaseOptions(baseUrl: Constants.baseUrl,
        validateStatus: (status) {
          if(status! < 500){
            return true;
          }else{
            return false;
          }
        },)
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