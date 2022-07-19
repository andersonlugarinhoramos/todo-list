import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list/app/core/database/sqlite_adm_connections.dart';
import 'package:todo_list/app/core/navigator/todo_list_navigator.dart';
import 'package:todo_list/app/modules/auth/auth_module.dart';
import 'package:todo_list/app/modules/home/home_module.dart';
import 'package:todo_list/app/modules/splash/splash_page.dart';
import 'package:todo_list/app/modules/task/task_module.dart';

import 'core/ui/todo_list_ui_config.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqlLiteAdm = SqliteAdmConnections();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqlLiteAdm);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqlLiteAdm);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: TodoListUiConfig.theme,
      navigatorKey: TodoListNavigator.navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      routes: {
        ...AuthModule().routers,
        ...HomeModule().routers,
        ...TaskModule().routers,
      },
      home: const SplashPage(),
    );
  }
}
