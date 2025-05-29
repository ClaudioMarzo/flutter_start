import 'dart:io';

class ValidarInput {
  static bool validarEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  static bool validarSenha(String senha) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(senha);
  }
}

class Usuario {
  String? _email;
  String? _senha;

  Usuario({String? email, String? senha}) {
    this.email = email;
    this.senha = senha;
  }

  // Getter para email
  String? get email => _email;

  // Setter para email com validação
  set email(String? value) {
    if (value != null && ValidarInput.validarEmail(value)) {
      _email = value;
    } else {
      throw Exception("Email inválido ao tentar atribuir ao usuário!");
    }
  }

  // Getter para senha
  String? get senha => _senha;

  // Setter para senha com validação
  set senha(String? value) {
    if (value != null && ValidarInput.validarSenha(value)) {
      _senha = value;
    } else {
      throw Exception("Senha inválida ao tentar atribuir ao usuário!");
    }
  }
  

  String toString() {
    return 'Usuario{email: $email, senha: $senha}';
  }
}

void main(){
  // Simula uma tela de login, com email e senha valida
  // stdout.write("Bem-vindo ao programa de cadatro de Email e Senha!\n");
  // String email = validarEmail();
  // imprimirBarra();
  // String senha = validarSenha();
  // imprimirBarra();


  String email = "Flutter@gmail.com";
  String senha = "Flutter2025";
  Usuario usuario = Usuario(email: email, senha: senha);
  print(usuario.email);
  print("Salvando no banco de dados...");
  sleep(Duration(seconds: 2));
  print(usuario);
  try{
    usuario.email = 'dasjdasjkdas';
  }catch(e){
    print("Erro: $e");
  }
  //
}