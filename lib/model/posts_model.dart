import 'package:flutter/cupertino.dart';

class PostsModel {


  static const _keyUserId = 'UserId';
  static const _keyId = 'Id';
  static const _keyTitle = 'title';
  static const _keyBody = 'body';


  final int userId;
  final int id;
  final String title;
  final String body;

   PostsModel(
      {
        required this.userId,
      required this.id,
      required this.title,
      required this.body});

    factory PostsModel.fromJson(Map<String ,dynamic> map){
      return PostsModel(
          userId: map['userId'],
          id: map['id'],
          title: map['title'],
          body: map['body']);
   }
   Map<String,dynamic> toJson() {
     return {
       _keyTitle: title,
       _keyBody: body,
       _keyUserId: userId,

     };
   }
    }
