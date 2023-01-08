import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/home.dart';
import 'controller.dart';
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

  int track = 0;
  final controller = Get.put(MyController());
  final myclassObs = Get.put(MyclassObs());
  final increments = Get.put(Increment());
  //final students = Students(name: "Tom", age: 18).obs;
  final autoIncrement = Get.put(AutoIncrement());
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
                  // students.update((students) {
                  //   students!.name = students.name.toUpperCase();
                  // });
                  if (0 == track) {
                    track = 1;

                    controller.uppercase();
                  } else if (1 == track) {
                    track = 0;
                    controller.lowercase();
                  }
                },
                child: Text("Change text")),
            Obx(() => Text(controller.students.name.value)),
            ElevatedButton(
                onPressed: () {
                  myclassObs.updatevalue();
                },
                child: Text("ClassOBs")),
            Obx(() => Text(myclassObs.nStudents.value.name)),
            ElevatedButton(
                onPressed: () {
                  Get.find<Increment>().incremnt();
                },
                child: Text("GetX Button")),
            GetX<Increment>(
                init: Increment(),
                builder: (con) {
                  return Text("The valu is nothing ${con.incre}");
                }),
            ElevatedButton(
                onPressed: () {
                  Get.find<Getbuilder>().incremetion();
                },
                child: Text("GetBuilder Button")),
            GetBuilder<Getbuilder>(
                init: Getbuilder(),
                builder: (con) {
                  return Text("the value is nothing ${con.incre}");
                }),
            GetBuilder<AutoIncrement>(
                init: AutoIncrement(),
                initState: (state) => autoIncrement.oninit(),
                dispose: (_) => autoIncrement.onClose(),
                builder: (con) {
                  return Text("Text ${con.cout}");
                }),
          ],
        ),
      ),
    );
  }
}
