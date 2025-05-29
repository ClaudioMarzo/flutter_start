class Pessoa{
  String? nome;

  Pessoa({this.nome});

  void cracha(){
    print('O nome $nome tem o crachá de Pessoa');
  }
}

class Professor extends Pessoa{
  String? cargo;
  Professor({this.cargo, String? nome}) : super(nome: nome);

  @override
  void cracha() {
    print('O nome $nome tem o crachá de Professor, cargo: $cargo');
  }
}

class Aluno extends Pessoa{
  String? curso;
  Aluno({this.curso, String? nome}) : super(nome: nome);

  @override
  void cracha() {
    print('O nome $nome tem o crachá de Aluno, curso: $curso');
  }
}

void main(){
  List<Pessoa> pessoas = [
    Pessoa(nome: 'Carlos'),
    Professor(nome: 'Ana', cargo: 'Docente'),
    Aluno(nome: 'Pedro', curso: 'Engenharia')
  ];

  for (var pessoa in pessoas) {
    pessoa.cracha();
  }
}