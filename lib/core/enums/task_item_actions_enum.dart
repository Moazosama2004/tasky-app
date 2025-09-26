enum TaskItemActionsEnum {
  edit(name: "Edit"),
  markAsRead(name: "Mark As Read"),
  delete(name: "Delete");

  final String name;
  const TaskItemActionsEnum({required this.name});
}
