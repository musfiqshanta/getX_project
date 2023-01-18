
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'students.dart';

class HomeBindings implements Bindings{
@override
void dependencies(){
Get.put(MyController());
Get.put(Increment());
Get.put(MyclassObs());

}

}





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
  void onInit() {
    print("init called");
    super.onInit();
  }

  @override
  void onClose() {
    print("Disclose");
    super.dispose();
  }
}

class Textfieldcount extends GetxController {
  var type = 0.obs;
  var x = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // ever(type, (_) => print("has been changed ${type}"));
    // once(type, (_) => print("has been changed ${type}"));
    //   debounce(type, (data) => print("deboudnce ${data}"),
    //       time: Duration(seconds: 1));
    // }
    interval(type, (data) => print("interval ${data}"),
        time: Duration(seconds: 3));
  }
}
