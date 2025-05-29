import 'dart:io';
import 'usuario.dart';
import 'validarInput.dart';


String validarEmail(){
  bool continuar = true;
  String? email;
  do{
    stdout.write("Digite seu email: ");
    email = stdin.readLineSync();
    if(email == null || email.isEmpty){
      print("Email não informar ou vazio!!");
      continue;
    }
    if(ValidarInput.validarEmail(email)){
      print("Email válido!");
      continuar = false;
    }else{
      print("Email inválido!");
    }
  }while(continuar);
  return email!;
}

String validarSenha(){
  bool continuar = true;
  String? senha;
  do{
    stdout.write("Digite sua senha: ");
    senha = stdin.readLineSync();
    if(senha == null || senha.isEmpty){
      print("Senha não informar ou vazio!!");
      continue;
    }
    if(ValidarInput.validarSenha(senha)){
      print("Senha válida e Forte!");
      continuar = false;
    }else{
      print("Senha fraca, digite caracteres, números e tenha tamanho 8!");
    }
  }while(continuar);
  return senha!;
}
void imprimirBarra(){
  print("--------------------------------------------------");
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