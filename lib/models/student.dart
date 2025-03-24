class Student {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final double grade;

  String get fullName {
    return '$firstName $lastName';
  }

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.grade,
  });

  Student copyWith({
    String? firstName,
    String? lastName,
    int? age,
    double? grade,
  }) {
    return Student(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      grade: grade ?? this.grade,
    );
  }
}
