import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  String grades = ""; // creating a var to store the value in

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final controller = TextEditingController(); // defining a controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number, // only numbers keyboard
            decoration: InputDecoration(
                // user input
                hintText: "enter your grade",
                prefixIcon: Icon(Icons.percent), //to add icon
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        ElevatedButton(
          // adding a button

          child: Text(
            "calculate",
          ),

          onPressed: () {
            String storage;

            print("hello ${controller.text}");
            int grade = int.parse(controller.text); // convert the grade to int
            if (grade == null) {
              // evaluation for the text feild to have only numbers
              print("${controller.text} is not a number");
              return;
            }
            // evaluating the garde
            if (grade >= 90) {
              print("you grade is A ");
              grades = "A"; // for the setState
            } else if (grade >= 80) {
              print("you grade is B");
            } else if (grade >= 70) {
              print("you grade is C");
            } else if (grade >= 60) {
              print("you grade is D");
            } else {
              print("you grade is F");
            }
            setState(() {});
            controller.clear();
          },
        ),
        Center(
          child: Container(
            color: Colors.lime,
            child: Text(
              "$grades",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
        ), // taxt that will pass grades
      ]),
    ));
  }
}
