import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'students.dart';

class MyController extends GetxController {
  Students students = Students();

  void uppercase() {
    students.name.value = students.name.value.toUpperCase();
  }

  void lowercase() {
    students.name.value = students.name.value.toLowerCase();
  }
}

class MyclassObs extends GetxController {
  final nStudents = NStudents(age: 13, name: "Kader").obs;

  void updatevalue() {
    nStudents.update((students) {
      students!.name = students.name.toUpperCase();
    });
  }
}

class Increment extends GetxController {
  var incre = 0.obs;

  void incremnt() {
    incre++;
  }
}

class Getbuilder extends GetxController {
  var incre = 0;
  void incremetion() {
    incre++;
    update(['one']);
  }
}

class AutoIncrement extends GetxController {
  int cout = 0;
  void increment() async {
    await Future.delayed(const Duration(seconds: 5));
    cout++;
    print("x");
    update();
  }

  void disposs() {
    print("Dispose");
    update();
  }

  @override
  void oninit() {
    print("init called");
    super.onInit();
  }

  @override
  void onClose() {
    print("Disclose");
    super.dispose();
  }
}
