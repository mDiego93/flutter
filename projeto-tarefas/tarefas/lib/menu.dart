import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterLogo(),
        Text("Desenvolvido por:"),
        Text("Diego Motta"),
        Icon(
          Icons.copyright,
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "pagina1");
          },
          child: Text("Pagina 1"),
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "pagina2");
          },
          child: Text("Pagina 2"),
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/");
          },
          child: Text("Logoff"),
        ),
      ],
    );
  }
}
