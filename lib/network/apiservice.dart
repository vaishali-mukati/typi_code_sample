import 'package:dio/dio.dart';
import 'package:typi_code_sample2/model/photomodel.dart';

class ApiService{

  static const _baseUrl = 'https://jsonplaceholder.typicode.com/';

  static final ApiService _Instance = ApiService._();

  final Dio dio;

   ApiService._():dio  = Dio(BaseOptions(baseUrl: _baseUrl));

   factory ApiService(){
     return _Instance;
   }
 
  Future<List<PhotoModel>>getPhotos() async{
     final response = await dio.get('/photos');
     List<PhotoModel> list = [];
     final data = response.data;
     if(data != null && data is List){
        for(var element in data){
          list.add(PhotoModel.fromjson(element));
        }
     }
     return list;
   }
}

