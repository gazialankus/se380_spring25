import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';
import 'package:se380spring25/student_edit_page.dart';

class StudentViewPage extends StatelessWidget {
  const StudentViewPage({super.key, required this.students, required this.studentId});

  final ValueNotifier<List<Student>> students;
  final int studentId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: students,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(value[studentId].fullName),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return StudentEditPage(students: students, studentId: studentId);
                  },));
                },
                child: Text('Edit'),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('First name:'),
                    Spacer(),
                    Text(value[studentId].firstName),
                  ],
                ),
                Row(
                  children: [
                    Text('Last name:'),
                    Spacer(),
                    Text(value[studentId].lastName),
                  ],
                ),
                Row(
                  children: [
                    Text('Age:'),
                    Spacer(),
                    Text(value[studentId].age.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text('Grade:'),
                    Spacer(),
                    Text(value[studentId].grade.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text('Status:'),
                    Spacer(),
                    Text(value[studentId].status ? 'pass' : 'fail'),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
