import 'package:flutter/material.dart';

void main() {
  f(8, j: 5, i: 5, l: 8);
  runApp(new MyAppInClass());
}

void f(int count, {required int i, int? j, int k = 5, int? l}) {
  print('another function called with $i');
  Employee e = Employee();
  Person p = e;
  setNameToJack(p);
}

void setNameToJack(Person e) {
  e.name = "Jack";
}

class Person {
  String? name;
}

class Employee extends Person {
  String? jobTitle;
}

class MyAppInClass extends StatelessWidget {
  const MyAppInClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
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
    doStupidStuff();
    setState(() {
      _counter++;
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
