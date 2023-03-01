class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: 'morning excerries', isDone: true),
      Todo(id: '02', todoText: 'after excerries', isDone: true),
      Todo(id: '03', todoText: 'before excerries', isDone: true),
      Todo(id: '04', todoText: 'team excerries', isDone: true),
      Todo(id: '05', todoText: 'ja excerries', isDone: true),
    ];
  }
}
