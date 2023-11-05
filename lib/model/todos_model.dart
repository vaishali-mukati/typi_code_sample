class TodosModel{

  const TodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed});

  final int userId;
  final int id;
  final String title;
  final bool completed;

  factory TodosModel.fromJson(Map<String ,dynamic> map){
      return TodosModel(
          userId: map['userId'],
          id: map['id'],
          title: map['title'],
          completed: map['completed']);
      }
}
