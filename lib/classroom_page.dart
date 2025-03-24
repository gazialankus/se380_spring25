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
    (index) => Student(
      id: index,
      firstName: 'Firstname$index',
      lastName: 'Lastname$index',
      age: 20 + index % 5,
      grade: 80 + index % 10,
    ),
  ); //['Ali', 'Ayşe', 'Hasan'];

  void onChanged(Student student) {
    setState(() {
      final index = students.indexWhere((element) => element.id == student.id);
      students[index] = student;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The classroom')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return StudentListItem(
            student: students[index],
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}

class StudentListItem extends StatelessWidget {
  const StudentListItem({
    super.key,
    required this.student, required this.onChanged,
  });

  final Student student;
  final void Function(Student student) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${student.firstName} ${student.lastName}'),
      subtitle: Text('Age: ${student.age}'),
      leading: CircleAvatar(child: Text(student.firstName[0])),
      trailing: Text('${student.grade}'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return StudentViewPage(student: student, onChanged: onChanged);
        },));
      },
    );
  }
}
