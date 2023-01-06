import 'package:flutter/material.dart';
import 'package:todo/Tasks/Data/TasksData.dart';

class globalKeyGenerator {
  static List<GlobalKey> gk = [];
  static int keyid = -1;

  addgk(String string) {
    GlobalKey string = GlobalKey();
    gk.add(string);
  }

  deletegk(int index) {
    gk.removeAt(index);
  }

  List<GlobalKey> addgkfromtodos() {
    // int i;
    for (int i = 0; i < todos.length; i++) {
      addgk(i.toString());

      // nextkeyid();
    }
    return gk;
  }

  static int nextkeyid() => (keyid++) % todos.length;
}
