import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/custom_text_form_field.dart';
import 'package:tasky_app/models/task_model.dart';

class AddNewTaskView extends StatefulWidget {
  const AddNewTaskView({super.key});

  @override
  State<AddNewTaskView> createState() => _AddNewTaskViewState();
}

class _AddNewTaskViewState extends State<AddNewTaskView> {
  // TODO DISPOSE CONTROLLERS
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController =
      TextEditingController();

  bool isHighPriority = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                title: 'Task Name',
                hintText: 'Finish UI design for login screen',
                controller: taskNameController,
                validator: (value) {
                  if (value?.trim().isEmpty ??
                      false || value == null) {
                    return 'Please Enter Task Name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.0),

              CustomTextFormField(
                title: 'Task Description',
                hintText:
                    'Finish onboarding UI and hand off to devs by Thursday.',
                controller: taskDescriptionController,
                validator: (value) {
                  if (value?.trim().isEmpty ??
                      false || value == null) {
                    return 'Please Enter Task Name';
                  } else {
                    return null;
                  }
                },
                maxLines: 5,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'High Priority',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFCFC),
                    ),
                  ),

                  Switch(
                    value: isHighPriority,
                    onChanged: (value) {
                      isHighPriority = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Spacer(),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    // log(taskDescriptionController.text);
                    final prefs =
                        await SharedPreferences.getInstance();

                    final tasksJson = prefs.getString('tasks');

                    List<dynamic> listTasks = [];

                    if (tasksJson != null) {
                      listTasks = jsonDecode(tasksJson);
                    }

                    TaskModel taskModel = TaskModel(
                      id: listTasks.length + 1,
                      taskName: taskNameController.text,
                      taskDescription:
                          taskDescriptionController.text
                              .trim()
                              .isEmpty
                          ? null
                          : taskDescriptionController.text,
                      isHighPriority: isHighPriority,
                    );

                    listTasks.add(taskModel.toJson());

                    final tasksEncoded = jsonEncode(listTasks);

                    await prefs.setString('tasks', tasksEncoded);
                    Navigator.pop(context, true);
                  }
                },
                label: 'Add Task',
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
