import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(Get.arguments),
        ),
        body: Column(
          children: [
            Text("This is homepage"),
            ElevatedButton(
                onPressed: () {
                  Get.back(
                    result: "Back from Homepage",
                  );
                },
                child: Text("Back To Homepage"))
          ],
        ));
  }
}
