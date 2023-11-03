import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/posts_model.dart';
import 'package:typi_code_sample2/network/apiservice.dart';
import 'package:typi_code_sample2/ui/posts/posts_list_item.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  late Future<List<PostsModel>> list;

  @override
  void initState() {
    list = ApiService().getPosts();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
      body:FutureBuilder(future: list,builder:(context,snapshot){
        return _handleSnapshot(snapshot);
      },),
    );
  }

  Widget _handleSnapshot(AsyncSnapshot<List<PostsModel>> snapshot){
    if(snapshot.hasData){
      return _buildList(snapshot.data ?? []);
    }else if(snapshot.hasError){
      return _buildError(snapshot.error.toString());

    }else{
      return _buildLoading();
    }
  }

  Text _buildError(String error) => Text(error);

  Widget _buildLoading () => const Center(child:CircularProgressIndicator());

  Widget _buildList (List <PostsModel> list){

    if(list.isEmpty) {
      return _buildError('No data');
    }
    return ListView.separated(
        itemCount: list.length > 50 ? 50 : list.length,
        separatorBuilder: (context , i) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context,index) {
              return PostListItem(
                  post:list[index]);
        }
        );
      }
    }

