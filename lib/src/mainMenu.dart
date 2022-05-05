import 'package:al/services/auth.dart';
import 'package:al/src/routes/enter/index.dart';
import 'package:al/src/routes/exit/index.dart';
import 'package:al/src/routes/home/index.dart';
import 'package:al/src/routes/settings/index.dart';
import 'package:al/src/routes/transfer/index.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  int pageIndex = 0;
  MainMenu({Key? key, this.pageIndex = 0}) : super(key: key);


  @override
  _MainMenu createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu>
{

  List listOfColors = [
    const HomeIndex(),
    const EnterIndex(),
    const ExitIndex(),
    const TransferIndex(),
    const SettIndex(),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthService().logout(context), icon: const Icon(Icons.exit_to_app)),
        ],
        title: const Text(
          'Inventario Seguro',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: listOfColors[widget.pageIndex],

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: widget.pageIndex,
        onItemSelected: (index){
          setState(() {
            widget.pageIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Inicio'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.plus_one),
            title: const Text('Entradas'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.exposure_minus_1),
            title: const Text('Salidas'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.code),
            title: const Text('Tranferencia'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Conf'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}