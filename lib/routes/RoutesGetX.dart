import 'package:get/get.dart';
import 'package:what_todo/screens/homepage.dart';
import 'package:what_todo/screens/taskpage.dart';
import 'package:what_todo/widgets.dart';

class RoutesGetX{

  static final routes = [
    GetPage(name: '/', page: () => Homepage()),
    GetPage(name: '/taskPage', page: () => Taskpage()),
    GetPage(name: '/taskCard', page: () => TaskCardWidget()),
  ];
}
