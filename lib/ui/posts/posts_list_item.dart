import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/posts_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key,required this.post});

  final PostsModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
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

