import 'package:dart_mappable/dart_mappable.dart';

part 'student1.mapper.dart';

@MappableClass()
class Student1 with Student1Mappable {
  String? id;
  String name;
  int age;

  Student1({
    this.id,
    required this.name,
    required this.age,
  });
}
