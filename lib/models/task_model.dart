import 'dart:developer';

class TaskModel {
  final String taskName;
  final String? taskDescription;
  final bool isHighPriority;
  bool isDone;

  TaskModel({
    required this.taskName,
    this.taskDescription,
    required this.isHighPriority,
    this.isDone = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return TaskModel(
      taskName: json['title'],
      taskDescription: json['description'],
      isHighPriority: json['isHighPriority'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': taskName,
      'description': taskDescription,
      'isHighPriority': isHighPriority,
      'isDone': isDone,
    };
  }
}
