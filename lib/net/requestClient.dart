
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:x_flutter_test/models/response_entity.dart';

RequestClient requestClient = RequestClient();

class RequestConfig {
  static const baseUrl = "https://www.wanandroid.com";
  static const connectTimeOut = Duration(seconds: 10);
  static const successCode = 0;
}

class RequestClient {
  late Dio _dio;

  RequestClient() {
    _dio = Dio(BaseOptions(
        baseUrl: RequestConfig.baseUrl,
        connectTimeout: RequestConfig.connectTimeOut));
    _dio.interceptors.add(PrettyDioLogger(request: true,requestBody: true,requestHeader: true));
  }

  Future<T?> request<T>(String url,
      {String method = "GET",
      Map<String, dynamic>? queryParameters,
      data,
      Map<String, dynamic>? headers}) async {
    Options options = Options()
      ..method = method
      ..headers = headers;
    Response response = await _dio.request(url,
        queryParameters: queryParameters, data: data, options: options);
    return _handleResponse(response);
  }

  T? _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      ResponseEntity<T> responseEntity =
          ResponseEntity<T>.fromJson(response.data,T as T Function(Object? json));
      return _handleBusinessResponse<T>(responseEntity);
    } else {
      return null;
    }
  }

  T? _handleBusinessResponse<T>(ResponseEntity<T> responseEntity) {
    if (responseEntity.errorCode == RequestConfig.successCode) {
      return responseEntity.data;
    } else {
      return null;
    }
  }

  Future<T?> get<T>(String url,
      {String method = "GET",
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers}){
    return request(url,queryParameters: queryParameters,headers: headers);
  }

  Future<T?> post<T>(String url,
      {String method = "POST",
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers}){
    return request(url,queryParameters: queryParameters,headers: headers,method: "POST",data: data);
  }
}
