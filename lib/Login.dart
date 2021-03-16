import 'package:flutter/material.dart';
import 'package:orcamento_movel/view/Main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  //variaveis
  var _logo = AssetImage("imagens/icons/inicio.png");
  var _botao = AssetImage("imagens/imagens/botao.png");
    TextEditingController _controllerTelefone = new TextEditingController();  
  
  //funções do sistemas

 


 void _LoginFace(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Main() 
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Orçamento Movel",
          ),
          backgroundColor: Color.fromRGBO(70, 75, 172, 1),
        ),
        backgroundColor: Color.fromRGBO(70, 75, 172, 1),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(60),
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(image: _logo),
                Padding(
                  padding: EdgeInsets.only(top: 70, bottom: 50),
                  child: Text(
                    "NUMERO DE TELEFONE",
                    style: TextStyle(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _controllerTelefone,
                  onSubmitted: (context){
                      
                  },

                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                    labelText: "(xx) xxxxx-xxxx",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    enabledBorder: InputBorder.none,
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      Radius.circular(1),
                    )),
                    filled: true,
                    fillColor: Colors.white12,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 50),
                    child: Text(
                      "OU",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                GestureDetector(
                  child: Image(image: _botao),
                  onTap: _LoginFace,
                )
              ],
            ),
          ),
        ));
  }
}
