import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Maioridade(),
    );
  }
}

class Maioridade extends StatefulWidget {
  const Maioridade({super.key});

  @override
  State<Maioridade> createState() => _MaioridadeState();
}

class _MaioridadeState extends State<Maioridade> {
  String nome = '';
  int idade = 0;
  String resultado = '';

  calcularMaioridade() {
    if (idade >= 18) {
      resultado = '$nome é maior de idade';
    } else {
      resultado = '$nome é menor de idade';
    }
    setState(() {
      resultado = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Maioridade"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Nome',
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    idade = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Idade',
                    labelText: 'Idade',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                  onPressed: () {
                    calcularMaioridade();
                  },
                  child: Text('Calcular')),
              Text(resultado)
            ],
          ),
        ));
  }
}
