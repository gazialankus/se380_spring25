import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';

class StudentEditPage extends StatelessWidget {
  const StudentEditPage({super.key, required this.student});

  final ValueNotifier<Student> student;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: student,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Edit ${value.fullName}')),
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
                    Text('Grade:'),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {
                          student.value = value.copyWith(
                            grade: value.grade - 1,
                          );
                        }, icon: Icon(Icons.minimize)),
                        Text(value.grade.toString()),
                        IconButton(onPressed: () {
                          student.value = value.copyWith(
                            grade: value.grade + 1,
                          );
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
    );
  }
}
