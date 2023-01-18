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
      initialBinding: HomeBindings(),
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
  //final controller = Get.put(MyController());
  //final myclassObs = Get.put(MyclassObs());
  final increments = Get.put(Increment());
  //final students = Students(name: "Tom", age: 18).obs;
  final autoIncrement = Get.put(AutoIncrement());
  final tcount = Get.put(Textfieldcount());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
              
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  tcount.type.value++;
                },
              ),
              Obx(() => Text(tcount.type.toString())),
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

                    //Get.off(Home());
                    //Get.offAll(Home());
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
                      Get.find<MyController>().uppercase();
                      //a controller.uppercase();
                    } else if (1 == track) {
                      track = 0;
                      Get.find<MyController>().lowercase();
                    }
                  },
                  child: Text("Change text")),
              Obx(() => Text(Get.find<MyController>().students.name.value)),
              ElevatedButton(
                  onPressed: () {
                    Get.find<MyclassObs>().updatevalue();
                  },
                  child: Text("ClassOBs")),
              Obx(() => Text(Get.find<MyclassObs>().nStudents.value.name)),
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
                  id: "one",
                  init: Getbuilder(),
                  builder: (con) {
                    return Text("the value is nothing ${con.incre}");
                  }),
              GetBuilder<Getbuilder>(
                  init: Getbuilder(),
                  builder: (con) {
                    return Text("the value is nothing ${con.incre}");
                  }),
              GetBuilder<AutoIncrement>(
                  init: AutoIncrement(),
                  initState: (state) => autoIncrement.increment(),
                  dispose: (_) => autoIncrement.onClose(),
                  builder: (con) {
                    return Text("Text ${con.cout}");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
