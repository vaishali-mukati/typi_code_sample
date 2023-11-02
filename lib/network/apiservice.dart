import 'package:dio/dio.dart';

class ApiService{

  static const _baseUrl = 'https://jsonplaceholder.typicode.com/';

  static final ApiService _Instance = ApiService._();

  final Dio dio;

   ApiService._():dio  = Dio(BaseOptions(baseUrl: _baseUrl));

   factory ApiService(){
     return _Instance;
   }
 
   getPhotos(){
     final response = dio.get('/photos');
     print('==========response$response');
   }
}

