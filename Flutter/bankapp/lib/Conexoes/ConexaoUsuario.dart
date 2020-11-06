import 'package:flutter/material.dart';

import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../Modelos/Cliente.dart';

class ConexaoUsuario {
  static Future<void> salvarUsuario({@required Cliente cliente}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("nomeCompleto", cliente.nomeCompleto);
    await prefs.setString("telefone", cliente.telefone);
    await prefs.setString("cpf", cliente.cpf);
    await prefs.setString("email", cliente.email);
    await prefs.setString("senha", cliente.senha);
    await prefs.setString("nascimento", cliente.nascimento);
  }

  Future<Cliente> resgataUsuario() async {
    Cliente cliente;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cliente.nomeCompleto = prefs.getString('nomeCompleto');
    cliente.telefone = prefs.getString('telefone');
    cliente.cpf = prefs.getString('cpf');
    cliente.email = prefs.getString('email');
    cliente.senha = prefs.getString('senha');
    cliente.nascimento = prefs.getString('nascimento');
    return cliente;
  }

  Future<Map<String, String>> resgataUsuarioComDic() async {
    Map<String, String> cliente;
    print('Método não implementado');
    return cliente;
  }
}
