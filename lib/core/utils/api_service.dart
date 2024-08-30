import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final String _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String _apiKey = 'dcb310be2ecda576819e5025740aa1e3';
  Dio dio;
  Future<dynamic> get(String endpoint) async {
    final response =
        await dio.get("$_baseUrl$endpoint?api_key=$_apiKey&page=2");
    return response.data;
  }
}
