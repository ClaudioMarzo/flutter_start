class Autor{
  String nome;

  Autor(this.nome);
}

class Livro {
  String titulo;
  Autor autor;

  Livro(this.titulo, this.autor);
}

void main() {
  var autor = Autor('J.K. Rowling');
  var livro = Livro('Harry Potter', autor);

  print('Livro: ${livro.titulo}, Autor: ${livro.autor.nome}');
}