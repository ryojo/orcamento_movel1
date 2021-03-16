


import 'package:flutter/material.dart';
import 'package:orcamento_movel/view/PartMain/viewbuttons/newBudget.dart';


class sendBudget extends StatefulWidget {
     
        dynamic metodo;

     sendBudget(this.metodo);

  @override
  _sendBudgetState createState() => _sendBudgetState();
   
  
  

}

class _sendBudgetState extends State<sendBudget> {
 


  
 
 
 @override


  Widget build(BuildContext context) {
   
  
    return Scaffold(
   
   backgroundColor: Colors.blueAccent,
body: Container(
    padding: EdgeInsets.fromLTRB(6, 60,6, 1),
  width: double.infinity,
  decoration: BoxDecoration(
    border: Border.all(width: 5,style:BorderStyle.solid, color: Colors.red),
   
  ),
    child: folha() ,
) ,
    );
  }
}

 Widget folha(){
   return  Container(
     width: double.infinity,
     padding: EdgeInsets.all(15),
     decoration: BoxDecoration(
       border: Border.all(width:3, color:Colors.blueAccent),
       borderRadius: BorderRadius.all(Radius.circular(50)),
       color: Colors.white,
       ),
       child: Column(
         children: <Widget>[
          
          
             
              
         ],
       ),
   );
}