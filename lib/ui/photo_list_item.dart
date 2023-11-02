import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/photomodel.dart';
class PhotoListItem extends StatelessWidget {

  const PhotoListItem({super.key,required this.photo});

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(photo.url),);
  }
}
