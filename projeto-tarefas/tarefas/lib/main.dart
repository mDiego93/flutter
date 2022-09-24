import 'package:flutter/material.dart';
import 'menu.dart';

void main() {
  runApp(
    inicio(),
  );
}

class inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: pagina1(),
      // home: pagina2(),
      // home: login(),
      routes: {
        '/': (context) => login(),
        'pagina1': (context) => pagina1(),
        'pagina2': (context) => pagina2(),
      },
    );
  }
}

class pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Pagina1"),
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "pagina2");
              },
              icon: Icon(
                Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        child: conteudoPagina1(),
      ),
    );
  }
}

class conteudoPagina1 extends StatefulWidget {
  _conteudoPagina1State createState() => _conteudoPagina1State();
}

class _conteudoPagina1State extends State<conteudoPagina1> {
  bool status = false;
  Color cor1 = Colors.green;
  Color cor2 = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: cor1,
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Container(
            height: 200,
            width: 200,
            color: cor2,
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Switch(
              value: status,
              onChanged: (value) {
                status = value;
                if (status) {
                  cor1 = Colors.orange;
                  cor2 = Colors.purple;
                } else {
                  cor1 = Colors.green;
                  cor2 = Colors.yellow;
                }
                setState(() {});
              })
        ],
      ),
    );
  }
}

class pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "pagina1");
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            Text("Pagina 2"),
          ],
        ),
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        child: conteudoPagina2(),
      ),
    );
  }
}

class conteudoPagina2 extends StatefulWidget {
  _conteudoPagina2State createState() => _conteudoPagina2State();
}

class _conteudoPagina2State extends State<conteudoPagina2> {
  double tamanho = 0;
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Slider(
            value: tamanho,
            onChanged: (value) {
              tamanho = value;
              num = tamanho.toInt();
              setState(() {});
            },
            min: 0,
            max: 100,
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            "$num",
            style: TextStyle(
              fontSize: tamanho,
            ),
          ),
        ],
      ),
    );
  }
}

class login extends StatelessWidget {
  String email = "";
  String senha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  senha = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "senha",
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              TextButton(
                onPressed: () {
                  if (email == "fit@fit.br" && senha == "123") {
                    print("Login Autorizado");
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Login Autorizado"),
                          );
                        });
                    Navigator.popAndPushNamed(context, "pagina1");
                  } else {
                    print("Usuario ou senha incorreto");
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Usuario ou senha incorreto"),
                          );
                        });
                  }
                },
                child: Text("Login"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueAccent, //cor do fundo

                  onSurface: Colors.grey,
                  padding: const EdgeInsets.all(25), //margem no botão ou
                  //fixedSize: const Size(100, 100), //tamanho fixo da margem
                  shape: RoundedRectangleBorder(
                    //side: BorderSide(color: Colors.green, width: 5), // borda do botão
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
