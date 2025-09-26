enum TaskItemActionsEnum {
  markAsDone(name: "Mark As Done"),
  edit(name: "Edit"),
  delete(name: "Delete");

  final String name;
  const TaskItemActionsEnum({required this.name});
}
