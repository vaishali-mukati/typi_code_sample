import 'package:dio/dio.dart';
import 'package:typi_code_sample2/model/photo_model.dart';
import 'package:typi_code_sample2/model/posts_model.dart';

class ApiService {

   static const _baseUrl = 'https://jsonplaceholder.typicode.com/';

 static final ApiService _Instance = ApiService._();


  final Dio dio;

  ApiService._() :dio = Dio(BaseOptions(baseUrl: _baseUrl));

 factory ApiService(){
    return _Instance;
  }


  Future<List<T>> _fetchList<T>(String path,
      T Function(Map<String, dynamic>) fromjson) async {
    final response = await dio.get(path);
    List<T> list = [];
    final data = response.data;
    if (data != null && data is List) {
      for (var element in data) {
        list.add(fromjson(element));
      }
    }
    return list;
  }

  Future<List<PhotoModel>> getPhotos() {
    return _fetchList<PhotoModel>('/photos', PhotoModel.fromjson);
  }

  Future<List<PostsModel>> getPosts() async {
    return _fetchList<PostsModel>('/posts', PostsModel.fromjson);
  }
}
