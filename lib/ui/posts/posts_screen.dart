import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/posts_model.dart';
import 'package:typi_code_sample2/network/apiservice.dart';

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
    );
  }
}
