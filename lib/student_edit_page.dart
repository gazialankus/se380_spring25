import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';

class StudentEditPage extends StatelessWidget {
  const StudentEditPage({super.key, required this.students, required this.studentId});

  final ValueNotifier<List<Student>> students;
  final int studentId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: students,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Edit ${value[studentId].fullName}')),
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {
                          final newStudent = value[studentId].copyWith(
                            grade: value[studentId].grade - 1,
                          );
                          students.value = [
                            for (final student in value)
                              if (student.id == studentId)
                                newStudent
                              else
                                student,
                          ];
                        }, icon: Icon(Icons.minimize)),
                        Text(value[studentId].grade.toString()),
                        IconButton(onPressed: () {
                          final newStudent = value[studentId].copyWith(
                            grade: value[studentId].grade + 1,
                          );
                          students.value = [
                            for (final student in value)
                              if (student.id == studentId)
                                newStudent
                              else
                                student,
                          ];
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
