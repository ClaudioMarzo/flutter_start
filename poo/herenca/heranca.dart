class Pessoa{
  String? nome;
  int? idade;

  Pessoa(this.nome, this.idade);
}

class Pai extends Pessoa{
  double renda;
  Pai({required this.renda, String? nome, int? idade}) : super(nome,  idade);

  String toString() {
    return 'Pai(nome: $nome, idade: $idade, renda: $renda)';
  }
}

class Filho extends Pai{
  String? escola;

  Filho({this.escola, required double renda}) : super(renda: renda);

  String toString() {
    return 'Filho($escola), $renda';
  }
}
void main(){
  var pai = Pai(idade: 12, nome: 'João', renda: 1000.0);
  var filho = Filho(escola: 'Escola XYZ', renda: 500.0);
  print(filho);
  print(pai);
}