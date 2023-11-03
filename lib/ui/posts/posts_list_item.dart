import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/posts_model.dart';
import 'package:typi_code_sample2/ui/posts/post_detail_screen.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key,required this.post});

  final PostsModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(ctx) =>
            PostDetailScreen(post: post),
        ),);
      },
      child: ListTile(
          leading:CircleAvatar(
            child: Text(post.id.toString()),
          ),
          title: Text(
            post.title,
            maxLines: 1,
            overflow:TextOverflow.ellipsis,),
        subtitle:Text(
          post.body,
          maxLines: 1,
          overflow:TextOverflow.ellipsis,),
      ),
    );
  }
}

