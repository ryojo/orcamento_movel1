import 'package:flutter/material.dart';
import 'package:orcamento_movel/view/PartMain/Buttons.dart';
import 'package:orcamento_movel/view/PartMain/Slide.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
//variaveis
  var user = AssetImage("imagens/icons/user.png");
  List menu = ["opções", "sair"];
  //List<Widget> janelas = [Slide(),Buttons()];

  //navegação entre telas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(86, 159, 238, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(86, 159, 238, 1),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: GestureDetector(
                        child: Image(
                          image: user,
                          fit: BoxFit.fill,
                        ),
                        onTap: () {},
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Slide(),
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: <Widget>[Buttons()],
                ),
              )
            ],
          ),
        ));
  }
}
