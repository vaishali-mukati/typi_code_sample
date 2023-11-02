import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:typi_code_sample2/model/photomodel.dart';
class PhotoListItem extends StatelessWidget {

  const PhotoListItem({super.key,required this.photo});

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:150,
        child:CachedNetworkImage(
          imageUrl:photo.thumbnailUrl,
          placeholder: (context,url){
                    return const CircularProgressIndicator();

                   },
                   errorWidget: (context ,url,error) =>Column(
                     children:  [
                         const Icon(Icons.error),
                       Text('Image loaded failed $error '),
                     ],
                   )
                ,)
    );
  }
}
