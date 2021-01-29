import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../Util/Botão/botaoPadrao.dart';
import '../Estilos/CaixaDeTexto.dart';
import '../Modelos/Cliente.dart';
import '../Conexoes/ConexaoUsuario.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final formKey = GlobalKey<FormState>();
  final Map<String, String> dadosCliente = {};
  final controllerPhone = MaskedTextController(mask: "(00) 00000-0000");
  final controllerBirth = MaskedTextController(mask: "00/00/0000");
  final controllerCPF = MaskedTextController(mask: "000.000.000-00");
  bool jahValidado;
  bool isAutovalidate = false;
  bool jahAceitouTermos = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'CADASTRO',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          centerTitle: true,
          leading: Icon(null),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidate: isAutovalidate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                caixaDeTexto(
                    label: 'Nome completo', hintText: 'Ex.: José da silva'),
                caixaDeTexto(
                    label: 'Data de nascimento',
                    controller: controllerBirth,
                    onTap: () => chooseDate(context)),
                caixaDeTextoComValidacao_Telefone(),
                caixaDeTextoComValidacao_CPF(),
                caixaDeTextoComValidacao_Email(),
                caixaDeTextoComValidacao_Senha(),
                caixaDeTextoComValidacao_ConfimacaoDeSenha(),
                checkBoxTermosDeUso(),
                botoesRodape(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  //   COMPONENTES
  //

  Widget checkBoxTermosDeUso() {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(
              value: jahAceitouTermos,
              activeColor: Color(0xff5B2434),
              onChanged: (value) {
                setState(() {
                  jahAceitouTermos = value;
                });
              }),
          Flexible(
            child: Text(
                'Li e aceito os termos de uso do usuário. Clique aqui para ver mais.'),
          ),
        ],
      ),
    );
  }

  Widget botoesRodape() {
    return Container(
      //decoration: BoxDecoration(border: Border.all()),
      margin: EdgeInsets.only(bottom: 9, top: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BotaoPadrao(
            titulo: 'Cancelar',
            onPressed: () => _tocouCancelar(),
            fundoBranco: false,
          ),
          Container(
            padding: EdgeInsets.all(10),
          ),
          BotaoPadrao(
            titulo: 'Concluir',
            onPressed: () => _tocouConcluir(),
            fundoBranco: false,
          )
        ],
      ),
    );
  }

  Widget caixaDeTexto({
    @required String label,
    String hintText,
    bool comSegredo,
    String Function(String) validator,
    MaskedTextController controller,
    void Function() onTap,
  }) {
    if (comSegredo == null) comSegredo = false;
    return Container(
      color: Color(0xff666),
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
      child: TextFormField(
        controller: controller != null ? controller : null,
        onSaved: (newValue) => dadosCliente['$label'] = '$newValue',
        onTap: onTap != null ? onTap : null,
        obscureText: comSegredo,
        decoration: EstiloCaixaDeTexto.padrao(label, hintText),
        validator: validator != null
            ? validator
            : (value) {
                if (value.length == 0) return 'Campo não preenchido.';
                return null;
              },
      ),
    );
  }

  Future<void> chooseDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final DateTime picked = await showDatePicker(
        context: context,
        // selectableDayPredicate: (datetime) {
        //   if (datetime.day == 10) {
        //     return false;
        //   }
        //   return true;
        // },
        initialDatePickerMode: DatePickerMode.day,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920, 12),
        lastDate: DateTime(2020, 12));

    if (picked != null && picked != DateTime.now()) {
      String formattedDate = DateFormat('ddMMyyyy').format(picked);
      controllerBirth.text = formattedDate;
    }
    return null;
  }

  //
  //   CAIXAS DE TEXTO COM VALIDAÇÃO
  //

  // ignore: non_constant_identifier_names
  Widget caixaDeTextoComValidacao_Senha() {
    String validator(String value) {
      String pattern = r'^((?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{8,32})$';
      RegExp regExp = new RegExp(pattern);
      if (value.isEmpty)
        return "Campo não preenchido.";
      else if (value.length < 8)
        return "Senha deve possuir pelo menos 8 caracteres.";
      else if (value.length > 32)
        return "Senha não pode ser maior que 32 caracteres.";
      else if (!regExp.hasMatch(value))
        return 'Senha inválida. Deve possuir letras e números.';
      return null;
    }

    return caixaDeTexto(label: 'Senha', comSegredo: true, validator: validator);
  }

  // ignore: non_constant_identifier_names
  Widget caixaDeTextoComValidacao_Telefone() {
    String validator(String value) {
      String patttern = r'^\([1-9]{2}\) (?:[2-8]|9[1-9])[0-9]{3}\-[0-9]{4}$';
      RegExp regExp = new RegExp(patttern);
      if (value.isEmpty)
        return "Campo não preenchido.";
      else if (value.length != 15)
        return "O celular deve ter 10 dígitos";
      else if (!regExp.hasMatch(value))
        return "O número do celular so deve conter dígitos";

      return null;
    }

    return caixaDeTexto(
      label: 'Telefone para contato',
      hintText: '(DDD) xxxxx-xxxx',
      validator: validator,
      controller: controllerPhone,
    );
  }

  // ignore: non_constant_identifier_names
  Widget caixaDeTextoComValidacao_CPF() {
    String validator(String value) {
      String pattern =
          r'([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})';
      RegExp regExp = new RegExp(pattern);
      if (value.isEmpty)
        return "Campo não preenchido.";
      else if (!regExp.hasMatch(value)) return "CPF Inválido";
      return null;
    }

    return caixaDeTexto(
        label: 'CPF',
        hintText: 'ex.: 000.000.000-00',
        validator: validator,
        controller: controllerCPF);
  }

  // ignore: non_constant_identifier_names
  Widget caixaDeTextoComValidacao_Email() {
    String validator(String value) {
      String pattern = r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
      RegExp regExp = RegExp(pattern);
      if (value.isEmpty)
        return 'Campo não preenchido.';
      else if (!regExp.hasMatch(value)) return 'Email inválido';
      return null;
    }

    return caixaDeTexto(
        label: 'Email', hintText: 'exemplo@exemplo.com', validator: validator);
  }

  // ignore: non_constant_identifier_names
  Widget caixaDeTextoComValidacao_ConfimacaoDeSenha() {
    String validator(String value) {
      if (value.isEmpty)
        return 'Campo não preenchido.';
      else if (value != dadosCliente['Senha']) return 'As senhas não coincidem';
      return null;
    }

    return caixaDeTexto(
        label: 'Confirme a senha', validator: validator, comSegredo: true);
  }

  //
  //    PRIVADOS
  //

  Cliente _preencheCliente() {
    Cliente cliente = Cliente(
        nomeCompleto: dadosCliente['Nome completo'],
        telefone: dadosCliente['Telefone para contato'],
        cpf: dadosCliente['CPF'],
        email: dadosCliente['Email'],
        senha: dadosCliente['Senha'],
        nascimento: dadosCliente['Data de nascimento']);

    return cliente;
  }

  //
  //    EVENTOS DA TELA
  //

  _tocouConcluir() async {
    if (formKey.currentState.validate() && jahAceitouTermos) {
      formKey.currentState.save();
      Cliente cliente = _preencheCliente();
      await ConexaoUsuario.salvarUsuario(cliente: cliente);
      
    } else
      setState(() {
        isAutovalidate = true;
      });
  }

  _tocouCancelar() {
    Navigator.of(context).pop();
  }
}
