import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/posts_model.dart';
class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({required this.post,super.key});

  final PostsModel post;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text(widget.post.title.substring(0,7)),
         ),
       body: Column(
         children: [
           Text(widget.post.title),
           Text(widget.post.body),
         ],
       ),
    );
  }
}

