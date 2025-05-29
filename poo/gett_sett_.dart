class Banco{
  double _saldo = 0.0;

  double get saldo => _saldo;

  void depositar(double valor) {
      _saldo += valor;
  }
  String toString() {
    return 'Banco{_saldo: $_saldo}';
  }
}

void main(){
  var banco = Banco();
  banco._saldo = 100.0; // Acesso direto ao campo privado
  print(banco);
}