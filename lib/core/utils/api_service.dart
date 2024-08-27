import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final String _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String _apiKey = 'dcb310be2ecda576819e5025740aa1e3';
  Dio dio;
  Future<dynamic> get(String endpoint) async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=dcb310be2ecda576819e5025740aa1e3&page=1");
    return response.data;
  }
}
// /popular