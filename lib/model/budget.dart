class budget{

  String nome;
  String endereco;
  String tel;
  String itens;
  int quantidade;
  int valor;



  budget({this.nome, this.endereco, this.tel, this.itens, this.quantidade, this.valor});
   
  

   set Nome (String nome){
    this.nome = nome; 
  }     
   
  String get Nome {
   return this.nome;
   }

   set Endereco(String endereco){
     this.endereco = endereco;
   }

    String get Endereco{
      return this.endereco;

    }

    set TEl(String tel){
      this.tel = tel;
    }

    String get Tel{
      return this.endereco;

    }

    set Itens(String itens){
      this.itens = itens;
    }

    String get Itens{
      return this.itens;
    }

    set Quantidade(int quantidade ){
      this.quantidade = quantidade;
    }

    int get Quantidade{
      return this.quantidade;
    }

    set Valor(int valor){
     this.valor = valor;
    }

    int get Valor{
       return this.valor; 
    }





}