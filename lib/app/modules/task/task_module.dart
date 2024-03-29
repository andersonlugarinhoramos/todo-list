import 'package:provider/provider.dart';
import 'package:todo_list/app/core/modules/todo_list_module.dart';
import 'package:todo_list/app/modules/task/task_controller.dart';
import 'package:todo_list/app/modules/task/task_page.dart';
import 'package:todo_list/app/repositories/task/task_repository.dart';
import 'package:todo_list/app/repositories/task/task_repository_impl.dart';
import 'package:todo_list/app/services/task/task_service.dart';
import 'package:todo_list/app/services/task/task_service_impl.dart';

class TaskModule extends TodoListModule {
  TaskModule()
      : super(
          bindings: [
            Provider<TaskRepository>(
              create: (context) =>
                  TaskRepositoryImpl(sqliteConnectionFactory: context.read()),
            ),
            Provider<TaskService>(
              create: (context) =>
                  TaskServiceImpl(taskRepository: context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) => TaskController(service: context.read()),
            )
          ],
          routers: {
            '/task/create': (context) => TaskPage(
                  controller: context.read(),
                ),
          },
        );
}
