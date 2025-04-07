import 'package:flutter/material.dart';
import 'package:se380spring25/models/student.dart';
import 'package:se380spring25/student_view_page.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({super.key});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  final students = List.generate(
    1000,
    (index) => ValueNotifier(
      Student(
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
    return Scaffold(
      appBar: AppBar(title: Text('The classroom')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return StudentListItem(
            student: students[index],
          );
        },
      ),
    );
  }
}

class StudentListItem extends StatelessWidget {
  const StudentListItem({
    super.key,
    required this.student,
  });

  final ValueNotifier<Student> student;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: student,
      builder: (context, value, child) => ListTile(
        title: Text('${student.value.firstName} ${student.value.lastName}'),
        subtitle: Text('Age: ${student.value.age}'),
        leading: CircleAvatar(child: Text(student.value.firstName[0])),
        trailing: Text('${student.value.grade}'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return StudentViewPage(student: student);
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
