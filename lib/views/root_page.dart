import 'package:app_musicplayer1/views/favorites_page.dart';
import 'package:app_musicplayer1/views/home_page.dart';
import 'package:flutter/material.dart';


class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  var _opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _opcaoSelecionada,
        children: const <Widget> [
          HomePage(),
          FavoritesPage()
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: (opcao){
          setState(() {
            _opcaoSelecionada = opcao;
          });
        },
        currentIndex: _opcaoSelecionada,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites")
        ]
      ),

    );
  }
}
