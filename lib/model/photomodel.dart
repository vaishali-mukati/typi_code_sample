class PhotoModel{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
});

  factory PhotoModel.fromjson(Map<String,dynamic>map){
    return PhotoModel(
        albumId: map['albumId'],
        id: map['id'],
        title: map['title'],
        url: map['url'],
        thumbnailUrl: map['thumbnailUrl']);
  }
}