import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orcamento_movel/model/budget.dart';
import 'package:orcamento_movel/view/PartMain/viewbuttons/sendBudget.dart';

import 'package:path_provider/path_provider.dart';

 class newBudget extends StatefulWidget {
 
 
  @override
  _newBudgetState createState() => _newBudgetState();
}

class _newBudgetState extends State<newBudget> {
  //Controllers
  TextEditingController _controllerNome = new TextEditingController();
  TextEditingController _controllerEndereco = new TextEditingController();
  TextEditingController _controllerData = new TextEditingController();
  TextEditingController _controllerTel = new TextEditingController();
   List lista = [];
 budget bu;
  // variaveis globais
  String _valor;

  //path
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  //salvar arquivo
  _salvarArquivo() async {
    var arquivo = await _getFile();
    String dados = json.encode(lista);
    return arquivo.writeAsString(dados);
  }

  //LerArquivo
  _lerArquivo() async {
    try {
      var arquivo = await _getFile();
      arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  _salvarTarefa() async {
    String nome = _controllerNome.text;
    String endereco = _controllerEndereco.text;
    //String data = _controllerData.text;
    String tel = _controllerTel.text.toString();

    //inputs dos itens
    String quantidadeItens = _controllerQuantidade.text.toString();
    String nomeItens = _controllerItens.text;
    String valor = _controllerValor.text;
    Map<String, dynamic> tar = Map();
      
     tar["nome"] = nome;
     tar["endereco"] = endereco;
     tar["tel"] = tel;


      
    
    

  
    
  

    //objetos de itens
    tar["itens"] = nomeItens;
    tar["quantidade"] = quantidadeItens;
    tar["valor"] = valor;
    
    
        setState(() {
     
      lista.add(tar);

    });
    _salvarArquivo();
    _controllerNome.clear();
    _controllerEndereco.clear();
    _controllerTel.clear();

    //inputs do itens
    _controllerItens.clear();
    _controllerQuantidade.clear();
    _controllerValor.clear();
  }

  Widget _caixa() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(width: 3, color: Colors.black26)),
      child: Expanded(
        child: ListView.separated(
          itemBuilder: _criarLista,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: Colors.black,
          ),

          itemCount: lista.length,
        ),
      ),
    );
  }

  Widget _folha() {
    return Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.amber),
            color: Color(0xfffff5ee)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _controllerNome,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(fontSize: 28, color: Colors.black)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _controllerEndereco,
                  decoration: InputDecoration(
                      labelText: "Endereço",
                      labelStyle: TextStyle(fontSize: 28, color: Colors.black)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  controller: _controllerData,
                  decoration: InputDecoration(
                      labelText: "Data",
                      labelStyle: TextStyle(fontSize: 28, color: Colors.black)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerTel,
                  decoration: InputDecoration(
                      labelText: "Tel/Cel",
                      labelStyle: TextStyle(fontSize: 28, color: Colors.black)),
                ),
              ),
              _caixa(),
              IconButton(
                icon: Icon(
                  Icons.add_box,
                  size: 39,
                  color: Colors.blueAccent,
                ),
                onPressed: _caixaDeDialogo,
              ),
            ],
          ),
        ));
  }

  //controllers
  TextEditingController _controllerItens = new TextEditingController();
  TextEditingController _controllerQuantidade = new TextEditingController();
  TextEditingController _controllerValor = new TextEditingController();
  //caixa de diálogo
  Widget _caixaDeDialogo() {
    showDialog(
        context: (context),
        child: AlertDialog(
          title: Text("Itens"),
          content: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controllerItens,
                  decoration:
                      InputDecoration(labelText: "Mão de obra ou peças"),
                ),
                TextField(
                  controller: _controllerQuantidade,
                  decoration: InputDecoration(
                    labelText: "Quantidade",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _controllerValor,
                  decoration: InputDecoration(
                    labelText: "Preço",
                  ),
                ),
                Text(" total por item ${_valor}"),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                _salvarTarefa();
                
              },
              child: Text("Salvar"),
              color: Colors.blueAccent,
            )
          ],
        ));
  }

  @override
  void initState() {
    _lerArquivo().then((dados) {
      setState(() {
        lista = json.decode(dados);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _salvarArquivo();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 790,
        padding: EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 60),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.amber),
            color: Colors.blueAccent),
        child: _folha(),
      ),
    );
  }

  Widget _criarLista(context, index) {
    return /* Dismissible(
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.startToEnd:
            lista.removeAt(index);
            _salvarArquivo();
        }
      },
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
      */
        

 
       
        ListTile(
         
      title: Text(
        lista[index] ["nome"] ,
        style: TextStyle(),
      ),
      subtitle: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Text("item ${lista[index]["itens"]}"),
            Text("quantidade ${lista[index]["quantidade"]}"),
            Text("R\$ ${lista[index]["valor"]}  ")
          ],
        ),
      ),
      onLongPress: () {
        showDialog(
            context: (context),
            child: AlertDialog(
                title: GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text("Deletar"),
                  )
                ],
              ),
              onTap: () {
                setState(() {
                  lista.removeAt(index);
                  _salvarArquivo();
                   enviarParaSendBudget(); 
                });
                Navigator.pop(context);
              },
            )));
      },
    );
  }

 enviarParaSendBudget(){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> sendBudget(_lerArquivo())), (route) => true);
 }




}
