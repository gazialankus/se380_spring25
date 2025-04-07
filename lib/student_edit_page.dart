import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';

class StudentEditPage extends StatefulWidget {
  const StudentEditPage(
      {super.key, required this.students, required this.studentId});

  final ValueNotifier<List<Student>> students;
  final int studentId;

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  late double grade;
  late bool status;
  late String firstName;
  // late String lastName; // will use a controller instead
  late TextEditingController lastNameController;

  @override
  void initState() {
    super.initState();
    grade = widget.students.value[widget.studentId].grade;
    status = widget.students.value[widget.studentId].status;
    firstName = widget.students.value[widget.studentId].firstName;
    lastNameController = TextEditingController(text: widget.students.value[widget.studentId].lastName);
  }

  @override
  void dispose() {
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.students,
        builder: (context, value, child) {
          return Scaffold(
            appBar:
                AppBar(title: Text('Edit ${value[widget.studentId].fullName}')),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('First name:'),
                      // Spacer(),
                      // Text(value[widget.studentId].firstName),
                      SizedBox(width: 48),
                      Expanded(
                        child: TextFormField(
                          initialValue: firstName,
                          onChanged: (value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            // THIS DOES NOT WORK! NO WAY TO DO THIS WITHOUT CONTROLLER!!!
                            firstName = '';
                          });
                        },
                        icon: Icon(Icons.clear),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Last name:'),
                      SizedBox(width: 48),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          lastNameController.text = '';
                        },
                        icon: Icon(Icons.clear),
                      ),
                      // Text(value[widget.studentId].lastName),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Age:'),
                      Spacer(),
                      Text(value[widget.studentId].age.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Grade:'),
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                grade -= 1;
                              },
                              icon: Icon(Icons.minimize)),
                          // Text(value[widget.studentId].grade.toString()),
                          Text('$grade'),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  grade += 1;
                                });
                              },
                              icon: Icon(Icons.add)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Status:'),
                      Spacer(),
                      Checkbox(
                        value: status,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              status = value;
                            });
                          }
                          print('CHANGE! $value');
                        },
                      ),
                    ],
                  ),
                  FilledButton(
                    onPressed: () {
                      print('save');
                      final newStudent = value[widget.studentId].copyWith(
                        grade: grade,
                        status: status,
                        firstName: firstName,
                        lastName: lastNameController.text,
                      );
                      widget.students.value = [
                        for (final student in value)
                          if (student.id == widget.studentId)
                            newStudent
                          else
                            student,
                      ];
                      Navigator.of(context).pop();
                    },
                    child: Text('save'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
