import 'package:flutter/material.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

          child: Text("calculate"),
          onPressed: () {
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
            } else if (grade >= 80) {
              print("you grade is B");
            } else if (grade >= 70) {
              print("you grade is C");
            } else if (grade >= 60) {
              print("you grade is D");
            } else {
              print("you grade is F");
            }
            controller.clear();
          },
        ),
      ]),
    ));
  }
}
