import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';

class StudentEditPage extends StatefulWidget {
  const StudentEditPage({super.key, required this.student, required this.onChanged});

  final Student student;
  final void Function(Student student) onChanged;

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit ${widget.student.fullName}')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('First name:'),
                Spacer(),
                Text(widget.student.firstName),
              ],
            ),
            Row(
              children: [
                Text('Last name:'),
                Spacer(),
                Text(widget.student.lastName),
              ],
            ),
            Row(
              children: [
                Text('Age:'),
                Spacer(),
                Text(widget.student.age.toString()),
              ],
            ),
            Row(
              children: [
                Text('Grade:'),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      setState(() {
                        final newStudent = widget.student.copyWith(
                          grade: widget.student.grade - 1,
                        );
                        widget.onChanged(newStudent);
                      });
                    }, icon: Icon(Icons.minimize)),
                    Text(widget.student.grade.toString()),
                    IconButton(onPressed: () {
                      setState(() {
                        final newStudent = widget.student.copyWith(
                          grade: widget.student.grade + 1,
                        );
                        widget.onChanged(newStudent);
                      });
                    }, icon: Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
