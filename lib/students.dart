import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Students {
  var name = "tom".obs;
  var age = 18.obs;


}
class NStudents {


  NStudents({required this.name, required this.age});

  String name;
  int age;
}
