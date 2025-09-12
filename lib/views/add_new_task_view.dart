import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xff181818),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffFFFCFC)),
        title: Text(
          'New Task',
          style: TextStyle(color: Color(0xffFFFCFC)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
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
              Text(
                'Task Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFCFC),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: taskNameController,
                validator: (value) {
                  if (value?.trim().isEmpty ??
                      false || value == null) {
                    return 'Please Enter Task Name';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Finish UI design for login screen',
                  hintStyle: TextStyle(
                    color: Color(0xff6D6D6D),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  fillColor: Color(0xff282828),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xff15B86C)),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Task Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFCFC),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: taskDescriptionController,
                maxLines: 5,
                validator: (value) {
                  if (value?.trim().isEmpty ??
                      false || value == null) {
                    return 'Please Enter Task Description';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText:
                      'Finish onboarding UI and hand off to devs by Thursday.',
                  hintStyle: TextStyle(
                    color: Color(0xff6D6D6D),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  fillColor: Color(0xff282828),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xff15B86C)),
                  ),
                ),
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
                    activeTrackColor: Color(0xff15B86C),
                    value: isHighPriority,
                    onChanged: (value) {
                      isHighPriority = value;
                      setState(() {});
                    },
                    // activeThumbColor: Color(0xff15B86C),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff15B86C),
                  foregroundColor: Color(0xffFFFCFC),
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    40,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.pop(context);
                  }
                },
                label: Text(
                  'Add Task',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
