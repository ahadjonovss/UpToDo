import 'package:up_todo/core/database/database.dart';

import '../models/task_model.dart';

Future<List<Task>> getList() async {

  List<Task> list=await LocalDatabase.getList();
  return list;
}