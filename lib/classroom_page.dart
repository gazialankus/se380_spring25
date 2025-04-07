import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';
import 'package:se380spring25/student_view_page.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({super.key});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  final students = ValueNotifier(
    List.generate(
      1000,
      (index) => Student(
        id: index,
        firstName: 'Firstname$index',
        lastName: 'Lastname$index',
        age: 20 + index % 5,
        grade: 80 + index % 10,
      ),
    ),
  ); //['Ali', 'Ayşe', 'Hasan'];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: students,
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text('The classroom')),
        body: ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            return StudentListItem(
              studentId: value[index].id,
              // TODO could use an InheritedWidget or InheritedNotifier to avoid passing students everywhere
              students: students,
            );
          },
        ),
      ),
    );
  }
}

class StudentListItem extends StatelessWidget {
  const StudentListItem({
    super.key,
    required this.studentId, required this.students,
  });

  final int studentId;
  final ValueNotifier<List<Student>> students;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: students,
      builder: (context, value, child) => ListTile(
        title: Text('${value[studentId].firstName} ${value[studentId].lastName}'),
        subtitle: Text('Age: ${value[studentId].age}'),
        leading: CircleAvatar(child: Text(value[studentId].firstName[0])),
        trailing: Text('${value[studentId].grade}'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return StudentViewPage(students: students, studentId: studentId);
            },
          ));
        },
      ),
    );
  }
}

// TODAY
// remind the current state of this app
// - discuss that source of issue is imperative navigation
// propose solutions
// - pass around valueNotifiers
// - pass around ids and single valueNotifier
// form elements and state management
// async/await
// server data?
