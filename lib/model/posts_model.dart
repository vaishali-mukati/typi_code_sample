class PostsModel {

  final int userId;
  final int id;
  final String title;
  final String body;

  const PostsModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

   factory PostsModel.fromjson(Map<String ,dynamic> map){
      return PostsModel(
          userId: map['userId'],
          id: map['id'],
          title: map['title'],
          body: map['body']);
   }
}
