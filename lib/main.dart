import 'package:flutter/material.dart';

void main() {
  final m = {
    'a': 1,
    'b': 2,
    if (1 == 2) 'c': 3,
  };

  final s = {1, 2, 3, 1};
  print(s);



  f(
    8,
    j: 5,
    i: 5,
    l: 8,
  );

  final isIncluded = 1 == 2;
  final lsub = [11, 12, 13];

  final List<num> l = [
    1,
    if (isIncluded) ...lsub else ...[4, 5],
    for (int i = 0; i < 5; ++i)
      i,
    2,
    3,
    if (isIncluded) 4.8 else ...[0, 5],
    5,
  ];
  for (final li in l) {
    print(li);
  }
  for (var i = 0; i < l.length; ++i) {
    print(l[i]);
  }
  //(i) {return '$i';}
  final lo = l.map((i) => i*2).toList();

  final lo1 = l.where((i) => i % 2 == 0).map((e) => e*2);

  print(l);
  print('l after where:');
  print(lo);
  print(lo1);

  runApp(new MyAppInClass());
}

void f(int count, {required int i, int? j, int k = 5, int? l}) {
  print('another function called with ${i + 1}');
  Employee e = Employee(name: 'aa');
  Person p = e;
  Person pn = Person(name: 'veli');

  Person.withAge(10, name: 'baby');

  p.name = 'ali';
  setNameToJack(p);
}

void setNameToJack(Person e) {
  e.name = "Jack";
}

class Person {
  String name;
  int? age;

  Person({required this.name});
  Person.withAge(int age, {required this.name});

  factory Person.olderBy10Than(Person other, int byHowMuch) {
    int newAge = other.age ?? 0 + byHowMuch;
    return Person.withAge(newAge, name: other.name);
  }

  // same as the following:
  // Person(String name) : this.name = name;
}

class Employee extends Person {
  String? jobTitle;

  Employee({required super.name});
}

class MyAppInClass extends StatelessWidget {
  const MyAppInClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        people: ['ali', 'veli', 'ahmet'],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.people});

  final String title;
  final List<String> people;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late List<String> people;

  @override
  void initState() {
    super.initState();
    people = widget.people;
  }
  void _incrementCounter() {
    void printSomething() {
      print('something');
    }

    printSomething();

    doStupidStuff();
    print('ITS NOT IN SETSTATE!!!!');
    setState(() {
      _counter++;
    });
    print('other stuff');
    setState(() {
      people = [...people, 'newguy $_counter'];
    });
  }

  void doStupidStuff() {
    print('hello');
    for (int counter = 0; counter < 10; ++counter) {
      printIt(counter);
    }
  }

  void printIt(int i) {
    print('$i');
  }

  @override
  Widget build(BuildContext context) {
    print('build is called');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print('pressed plus');
            _incrementCounter();
          },
          icon: Text('add'),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              print('pressed plus');
              _incrementCounter();
            },
            icon: Icon(Icons.add),
          ),
          if (_counter >= 10) ...[
            IconButton(
              onPressed: () {
                _counter = 0;
                // setState(() {
                // });
              },
              icon: Icon(Icons.reset_tv),
            ),
            Text('woo hold on reset now!')
          ]
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PUSH PUSH PUSH oaueuaeo',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            PeopleView(people),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.subtitles),
      ),
    );
  }
}

class PeopleView extends StatelessWidget {
  const PeopleView(this.people, {super.key});

  final List<String> people;

  @override
  Widget build(BuildContext context) {
    return Column(
      // children: [
      //   for (final person in people)
      //     PersonView(person: person),
      // ],
      // ^ the same as below v
      children: people.map((person) =>
          PersonView(person: person)).toList(),
    );
  }
}


class PersonView extends StatefulWidget {
  const PersonView({
    required this.person,
  });

  final String person;

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  int grade = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.person,
          style: TextStyle(color: Colors.red),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            setState(() {
              grade++;
            });
          },
          icon: Icon(Icons.plus_one),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              grade--;
            });
          },
          icon: Icon(Icons.exposure_minus_1),
        ),
        GradeView(grade: grade),
      ],
    );
  }
}

class GradeView extends StatefulWidget {
  const GradeView({
    super.key,
    required this.grade,
  });

  final int grade;

  @override
  State<GradeView> createState() => _GradeViewState();
}

class _GradeViewState extends State<GradeView> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          print('${widget.grade}');
        });
      },
      child: Text('${widget.grade}'),
    );
  }
}
