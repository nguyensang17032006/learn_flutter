import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({
    required this.item,
    required this.deleteTask,
    required this.index,
    super.key,
  });

  final index;
  final item;
  final Function(String) deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? Colors.blue : Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  deleteTask(item.id);
                }
                return;
              },
              child: Icon(Icons.delete, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
