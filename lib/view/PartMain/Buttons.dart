import 'package:flutter/material.dart';

import 'package:orcamento_movel/view/PartMain/viewbuttons/newBudget.dart';
import 'package:orcamento_movel/view/PartMain/viewbuttons/sendBudget.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
  newBudget bu = new newBudget();
  
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color.fromRGBO(142, 188, 238, 1),
      ),
      height: 380,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "imagens/icons/criar.png",
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Novo Orçamento",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newBudget()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "imagens/icons/enviar.png",
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Enviar Orçamento",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new sendBudget(newBudget())));
              
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "imagens/icons/consultar.png",
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Verificar Orçamentos",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              onTap: () {},
            ),
          )

          /*GestureDetector(
      child:Image.asset("imagens/icons/enviar.png"),
      onTap: (){

      },
    )*/
        ],
      ),
    );
  }
}
