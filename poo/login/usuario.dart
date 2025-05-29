import 'validarInput.dart';

class Usuario{
  String? _email;
  String? _senha;


  Usuario({String? email, String? senha}){
    this._email = email;
    this._senha = senha;
  }

  String? get email => _email;

  set email(String? email){
    if(email != null && ValidarInput.validarEmail(email)){
      this._email = email;
    }else{
      throw Exception("Email informado está no formado invalido!");
    }
  }

  String toString() {
    return 'Usuario{email: $_email, senha: $_senha}';
  }
}