import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 1},
        {'texto': 'Azul', 'pontuacao': 7},
        {'texto': 'Branco', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 2},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Coelho', 'pontuacao': 4},
        {'texto': 'Cobra', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'João', 'pontuacao': 0},
        {'texto': 'Maria', 'pontuacao': 3},
        {'texto': 'Cuelho', 'pontuacao': 6},
        {'texto': 'Leo', 'pontuacao': 10},
      ],
    }
  ];

  void _responder(int pontuacao) {
    // nesse metodo colocamos oq vai ser alterado
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    } 
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
