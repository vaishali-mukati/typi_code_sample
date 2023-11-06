import 'package:dio/dio.dart';
import 'package:typi_code_sample2/model/photo_model.dart';
import 'package:typi_code_sample2/model/posts_model.dart';
import 'package:typi_code_sample2/model/todos_model.dart';

class ApiService {

   static const _baseUrl = 'https://jsonplaceholder.typicode.com/';

 static final ApiService _instance = ApiService._();


  final Dio dio;

  ApiService._() :dio = Dio(BaseOptions(baseUrl: _baseUrl)){
     dio.options.headers['Content-type'] ='application/json; charset=UTF-8';
  }

 factory ApiService(){
    return _instance;
  }


  Future<List<T>> _fetchList<T>(String path,
      T Function(Map<String, dynamic>) fromJson) async {
    final response = await dio.get(path);
    List<T> list = [];
    final data = response.data;
    if (data != null && data is List) {
      for (var element in data) {
        list.add(fromJson(element));
      }
    }
    return list;
  }

  Future<List<PhotoModel>> getPhotos() {
    return _fetchList<PhotoModel>('/photos', PhotoModel.fromjson);
  }

  Future<List<PostsModel>> getPosts() {
    return _fetchList<PostsModel>('/posts', PostsModel.fromJson);
  }
  
  Future<List<TodosModel>> getTodos(){
     return _fetchList('/todos', TodosModel.fromJson);
  }

  Future<PostsModel> addPost(PostsModel post) async{
      final response =  await dio.post('/posts' ,data:post.toJson());
      return PostsModel.fromJson(response.data);
       }
  }
