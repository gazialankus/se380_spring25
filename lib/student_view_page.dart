import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';
import 'package:se380spring25/student_edit_page.dart';

class StudentViewPage extends StatelessWidget {
  const StudentViewPage({super.key, required this.student});

  final ValueNotifier<Student> student;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: student,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(value.fullName),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return StudentEditPage(student: student);
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
                    Text(value.firstName),
                  ],
                ),
                Row(
                  children: [
                    Text('Last name:'),
                    Spacer(),
                    Text(value.lastName),
                  ],
                ),
                Row(
                  children: [
                    Text('Age:'),
                    Spacer(),
                    Text(value.age.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text('First name:'),
                    Spacer(),
                    Text(value.grade.toString()),
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
