import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> enviarResposta(
    String nome, String email, String telefone, String turma) async {
  var resposta = await http.post(
    Uri.parse('http://10.0.3.132:1313/save-data'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome:': nome,
      'email:': email,
      'telefone:': telefone,
      'turma:': turma,
    }),
  );

  print(resposta.body.toString());

  // http://10.0.3.132:1313/listar-aluno

  return resposta;
}

/* Future<http.Response> Pegar(String title) async {
  var envio = await http.post(
    Uri.parse('http://10.0.3.132:1313/save-data'),
    body: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}*/

final nome = TextEditingController();
final email = TextEditingController();
final telefone = TextEditingController();
final turma = TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Flutter'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            width: 200,
            height: 100,
            child: TextField(
                controller: nome,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nome:')),
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'email:')),
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: TextField(
                controller: telefone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'telefone:')),
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: TextField(
                controller: turma,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'turma:')),
          ),
          ElevatedButton(
            onPressed: () {
              enviarResposta(nome.text, email.text, telefone.text, turma.text);
            },
            child: const Text('Enviar'),
          )
        ]),
      ),
    );
  }
}
