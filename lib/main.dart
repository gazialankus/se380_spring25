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

  final l = [
    1,
    if (isIncluded) ...lsub else ...[4, 5],
    for (int i = 0; i < 5; ++i)
      i,
    2,
    3,
    if (isIncluded) 4.8 else ...[0, 5],
    5,
  ];

  print(l);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name = 'ali';

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
      name = 'mohammad';
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
            Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
