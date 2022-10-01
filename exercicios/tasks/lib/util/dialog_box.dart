import 'package:flutter/material.dart';
import 'package:tasks/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo[50],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Adicione uma nova tarefa",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //save button
                MyButton(text: "Salvar", onPressed: onSave),

                const SizedBox(width: 10),

                //cancel button
                MyButton(text: "Cancelar", onPressed: onCancel)
              ],
            ),
            // buttons -> save + cancel
          ],
        ),
      ),
    );
  }
}
