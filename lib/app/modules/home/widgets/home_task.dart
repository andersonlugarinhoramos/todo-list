import 'package:flutter/material.dart';

class HomeTask extends StatelessWidget {
  const HomeTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.grey),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 1),
          ),
          leading: Checkbox(value: true, onChanged: (value) {}),
          title: const Text(
            'Descrição da Task',
            style:
                TextStyle(decoration: true ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(
            '20/07/2022',
            style:
                TextStyle(decoration: true ? TextDecoration.lineThrough : null),
          ),
        ),
      ),
    );
  }
}
