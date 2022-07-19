import 'package:flutter/material.dart';
import 'package:todo_list/app/core/ui/theme_extensions.dart';
import 'package:todo_list/app/modules/home/widgets/home_task.dart';

class HomeListTask extends StatelessWidget {
  const HomeListTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('TASK\'S DE HOJE', style: context.titleStyle),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeTask(),
              HomeTask(),
              HomeTask(),
              HomeTask(),
              HomeTask(),
              HomeTask(),
              HomeTask(),
            ],
          )
        ],
      ),
    );
  }
}
