import 'package:flutter/material.dart';

void main() {
  f();
  runApp(new MyAppInClass());
}

void f() {
  print('another function');
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  void _incrementCounter() {
    doStupidStuff();
    setState(() {
      _counter++;
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
              'PUSH PUSH PUSH',
            ),
            Text(
              '$_counter',
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
