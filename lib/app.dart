import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:reduxtoflutter/todo_edit_page/page.dart';
import 'package:reduxtoflutter/todo_list_page/page.dart';

Widget createApp() {
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'todo_list': ToDoListPage(),
        'todo_edit': TodoEditPage(),
      },
    )
  ]);

  return MaterialApp(
    title: 'Fluro',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('todo_list', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
