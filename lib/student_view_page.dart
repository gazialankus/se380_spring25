import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';
import 'package:se380spring25/student_edit_page.dart';

class StudentViewPage extends StatelessWidget {
  const StudentViewPage({super.key, required this.student, required this.onChanged});

  final Student student;
  final void Function(Student student) onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.fullName),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return StudentEditPage(student: student, onChanged: onChanged);
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
                Text(student.firstName),
              ],
            ),
            Row(
              children: [
                Text('Last name:'),
                Spacer(),
                Text(student.lastName),
              ],
            ),
            Row(
              children: [
                Text('Age:'),
                Spacer(),
                Text(student.age.toString()),
              ],
            ),
            Row(
              children: [
                Text('First name:'),
                Spacer(),
                Text(student.grade.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
