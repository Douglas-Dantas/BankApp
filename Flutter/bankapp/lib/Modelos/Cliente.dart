import 'package:flutter/cupertino.dart';

class Cliente {
  String nomeCompleto;
  String telefone;
  String cpf;
  String email;
  String senha;
  String nascimento;

  Cliente(
      {@required this.nomeCompleto,
      @required this.telefone,
      @required this.cpf,
      @required this.email,
      @required this.senha,
      @required this.nascimento});
}
