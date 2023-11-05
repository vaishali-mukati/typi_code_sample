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
           title:Text('userId: ${widget.post.userId}'),
         ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child:Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Icon(
               Icons.star,
               size: 36,
             ),
                const SizedBox(
                    width: 16
                ),
                 Flexible(
                     child:Column(
                       children:[
                         Text(
                           widget.post.title,
                           style:const TextStyle(
                           fontSize: 16,
                               fontWeight: FontWeight.w600),
                         ),
                         const SizedBox(
                             height: 16),
                         Text(
                             widget.post.body
                         ),
                       ],
                     ),
                 ),
                ],
             ),
       ),
    );
  }
}

