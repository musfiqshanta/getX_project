import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/home.dart';
import 'students.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
  var _counter = 0.obs;
  void increment() {
    _counter++;
  }

  final students = Students(name: "Tom", age: 18).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("Hi", "I'm modern snackbar");
                },
                child: Text("SnackBar")),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(title: "Hello");
                },
                child: Text("Dialog")),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      child: ListView(children: [
                        ListTile(
                          title: Text("Dark mode"),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        ),
                        ListTile(
                          title: Text("Lite mode"),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                      ]),
                    ),
                    backgroundColor: Colors.red,
                  );
                },
                child: Text("Bottom Sheet")),
            ElevatedButton(
                onPressed: () async {
                  var data = await Get.to(
                    Home(),
                    opaque: true,
                    transition: Transition.rightToLeft,
                    curve: Curves.bounceIn,
                    fullscreenDialog: true,
                    arguments: "Hi shona",
                  );

                  print("Data value");
                  print(data);
                },
                child: Text("Go to Homepage")),
            ElevatedButton(
                onPressed: () {
                  increment();
                },
                child: Text("Increment")),
            Obx(() => Text(_counter.toString())),
            ElevatedButton(
                onPressed: () {
                  students.update((students) {
                    students!.name = students.name.toUpperCase();
                  });
                },
                child: Text("Change text")),
            Obx(() => Text(students.value.name))
          ],
        ),
      ),
    );
  }
}
