import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:typi_code_sample2/model/photomodel.dart';
class PhotoListItem extends StatelessWidget {

  const PhotoListItem({super.key,required this.photo});

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration:const  BoxDecoration(
         color:Colors.white,
          boxShadow:[
            BoxShadow(
            color:Colors.black26,
              offset: Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 0,

          ),],
       ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              children: [
                SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: CachedNetworkImage(
                        imageUrl:photo.thumbnailUrl,
                        fit: BoxFit.cover,
                        placeholder: (context,url) =>const SizedBox(
                          width: 24,
                            height: 24,
                           child: Center(child: CircularProgressIndicator(),),
                        ),
                          errorWidget :(context ,url,error) => Column(
                            children: [
                              const Icon(Icons.error) ,Text('Image loaded failed $error'),
                            ],
                          )
                      ),
                    ),
                    Positioned(bottom:0,child: _buildInfo())
                  ],
                ),
          ),

    );
  }

  Container _buildInfo() => Container(
    padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('album:${photo.albumId}'),
                Text('photoId:${photo.id}'),
              ],
            ),
            Text(photo.url),
          ],
        ),
  );
}
