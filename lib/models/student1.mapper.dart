// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'student1.dart';

class Student1Mapper extends ClassMapperBase<Student1> {
  Student1Mapper._();

  static Student1Mapper? _instance;
  static Student1Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Student1Mapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Student1';

  static String? _$id(Student1 v) => v.id;
  static const Field<Student1, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(Student1 v) => v.name;
  static const Field<Student1, String> _f$name = Field('name', _$name);
  static int _$age(Student1 v) => v.age;
  static const Field<Student1, int> _f$age = Field('age', _$age);

  @override
  final MappableFields<Student1> fields = const {
    #id: _f$id,
    #name: _f$name,
    #age: _f$age,
  };

  static Student1 _instantiate(DecodingData data) {
    return Student1(
        id: data.dec(_f$id), name: data.dec(_f$name), age: data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static Student1 fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Student1>(map);
  }

  static Student1 fromJson(String json) {
    return ensureInitialized().decodeJson<Student1>(json);
  }
}

mixin Student1Mappable {
  String toJson() {
    return Student1Mapper.ensureInitialized()
        .encodeJson<Student1>(this as Student1);
  }

  Map<String, dynamic> toMap() {
    return Student1Mapper.ensureInitialized()
        .encodeMap<Student1>(this as Student1);
  }

  Student1CopyWith<Student1, Student1, Student1> get copyWith =>
      _Student1CopyWithImpl<Student1, Student1>(
          this as Student1, $identity, $identity);
  @override
  String toString() {
    return Student1Mapper.ensureInitialized().stringifyValue(this as Student1);
  }

  @override
  bool operator ==(Object other) {
    return Student1Mapper.ensureInitialized()
        .equalsValue(this as Student1, other);
  }

  @override
  int get hashCode {
    return Student1Mapper.ensureInitialized().hashValue(this as Student1);
  }
}

extension Student1ValueCopy<$R, $Out> on ObjectCopyWith<$R, Student1, $Out> {
  Student1CopyWith<$R, Student1, $Out> get $asStudent1 =>
      $base.as((v, t, t2) => _Student1CopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class Student1CopyWith<$R, $In extends Student1, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, int? age});
  Student1CopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Student1CopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Student1, $Out>
    implements Student1CopyWith<$R, Student1, $Out> {
  _Student1CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Student1> $mapper =
      Student1Mapper.ensureInitialized();
  @override
  $R call({Object? id = $none, String? name, int? age}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != null) #name: name,
        if (age != null) #age: age
      }));
  @override
  Student1 $make(CopyWithData data) => Student1(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      age: data.get(#age, or: $value.age));

  @override
  Student1CopyWith<$R2, Student1, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _Student1CopyWithImpl<$R2, $Out2>($value, $cast, t);
}
