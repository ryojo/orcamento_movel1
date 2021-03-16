import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Slide extends StatelessWidget {

 List<Widget> imagens = [
  Image.asset("imagens/imagens/businessman.jpg"),
  Image.asset("imagens/imagens/imagem.jpg"),
 ];
 
  
  @override
  Widget build(BuildContext context) {
 
 
 
 
 
    return Container(
      
      width: double.infinity,
      padding: EdgeInsets.all(0),
      child: Column(
      
      children: <Widget>[
       CarouselSlider(
        
         items: imagens, 
       options: CarouselOptions(
         autoPlay: true,
         autoPlayInterval: Duration(seconds: 5),
         autoPlayAnimationDuration: Duration(milliseconds: 800),
         autoPlayCurve: Curves.fastOutSlowIn,
         scrollDirection: Axis.horizontal,
       )
       ),
      ],
    ), 
    );
    
    
    
  }
}