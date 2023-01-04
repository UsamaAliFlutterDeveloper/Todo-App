import 'package:objectbox/objectbox.dart';

@Entity()
class TodoListItemModel {
  @Id(assignable: true)
  String? id;
  String? todoText;
  bool isDone;
  TodoListItemModel(
      {required this.id, required this.todoText, this.isDone = false});
  static List<TodoListItemModel> todoList() {
    return [
      TodoListItemModel(id: '03', todoText: 'Morning Exercise', isDone: false),
      TodoListItemModel(
          id: '01', todoText: 'Today Work Which i have done', isDone: true),
      TodoListItemModel(
          id: '02', todoText: 'I have done different exercise ', isDone: false),
    ];
  }
}
