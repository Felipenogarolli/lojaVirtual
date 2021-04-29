import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(   // criando a degrade de cores
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 101, 168)
          ],
          begin: Alignment.topLeft,   //comeca na esquerda
          end: Alignment.bottomRight  //termina na direita

        )
      ),
    );
    return  Stack (             // conteudo acima do fundo, colocar alguma coisa em cima da outra
      children: <Widget> [
        _buildBodyBack(),
        CustomScrollView(    //função para deixar o appbar desaparecer
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0,          //deixa sem sombra
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(" novidades"),  // const para otimizar, sempre terá o mesmo valor
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                future: Firestore.instance.collection("home").orderBy("posicao").getDocuments(),

            )

          ],
        )
      ],
    );
  }
}
