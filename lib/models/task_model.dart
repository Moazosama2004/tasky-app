import 'dart:developer';

class TaskModel {
  final int id;
  String taskName;
  String? taskDescription;
  bool isHighPriority;
  bool isDone;

  TaskModel({
    required this.id,
    required this.taskName,
    this.taskDescription,
    required this.isHighPriority,
    this.isDone = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return TaskModel(
      id: json['id'],
      taskName: json['title'],
      taskDescription: json['description'],
      isHighPriority: json['isHighPriority'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': taskName,
      'description': taskDescription,
      'isHighPriority': isHighPriority,
      'isDone': isDone,
    };
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, taskName: $taskName, taskDescription: $taskDescription, isHighPriority: $isHighPriority, isDone: $isDone)';
  }
}
