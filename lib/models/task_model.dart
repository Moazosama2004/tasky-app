class TaskModel {
  final String taskName;
  final String taskDescription;
  final bool isHighPriority;

  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['title'],
      taskDescription: json['description'],
      isHighPriority: json['isHighPriority'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': this.taskName,
      'description': this.taskDescription,
      'isHighPriority': this.isHighPriority,
    };
  }
}
