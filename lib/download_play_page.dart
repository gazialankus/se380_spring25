import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:se380spring25/models/student1.dart';

// class Student1 {
//   String id;
//   String name;
//   int age;
//
//   Student1({
//     required this.id,
//     required this.name,
//     required this.age,
//   });
//
//   Student1.fromMap(Map<String, dynamic> m) : this(
//     id: m['id'],
//     name: m['name'],
//     age: m['age'],
//   );
// }

class DownloadPlayPage extends StatefulWidget {
  const DownloadPlayPage({super.key});

  @override
  State<DownloadPlayPage> createState() => _DownloadPlayPageState();
}

class _DownloadPlayPageState extends State<DownloadPlayPage> {
  List<Student1> students = [];

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOWNLOAD'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        isLoading = true;
                      });

                      final dio = Dio();

                      final response = await dio.get<List<dynamic>>(
                          'https://6758210060576a194d0ef757.mockapi.io/students');
                      await Future.delayed(Duration(seconds: 2));

                      final data = response.data;

                      if (data != null) {
                        setState(() {
                          students = data
                              .map((e) => Student1Mapper.fromMap(e))
                              .toList();
                        });
                      }

                      print('');
                    } catch (e, st) {
                      print('error');
                      print(e);
                      print(st);
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Text('Start'),
                ),
                Text('${students.length} students'),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      final dio = Dio();

                      final newStudent = Student1(
                        name: 'Ali',
                        age: 20,
                      );

                      var response = await dio.post(
                        'https://6758210060576a194d0ef757.mockapi.io/students',
                        data: newStudent.toMap(),
                        options: Options(
                          headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                          },
                        ),
                      );

                      print('worked');
                    } catch (e) {
                      print('error');
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Text('Post'),
                ),
              ],
            ),
    );
  }
}
