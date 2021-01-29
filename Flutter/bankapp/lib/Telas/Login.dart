import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'Cadastro.dart';
import '../Util/popup_cadastro.dart';
import '../Util/popup_content.dart';
import '../Util/Botão/botaoPadrao.dart';
import '../Telas/TelaInicial.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //final _formKey = GlobalKey<FormState>();
  bool esconderSenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      resizeToAvoidBottomInset: true,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ExibirLogo(
                width: 250,
                hight: 250,
                comAnimacao: true,
              ),
              emailTextField(),
              senhaTextField(),
              Text('Esqueceu a senha?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  )),
              botoesEntrarERegistrar(),
            ],
          ),
        ),
      ),
    );
  }

  //COMPONENTES

  Widget emailTextField() {
    return Container(
      margin: EdgeInsets.only(left: 65, right: 65, bottom: 5),
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff5B2434), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: TextFormField(
        cursorColor: Colors.black,
        enableSuggestions: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          icon: Icon(
            Icons.email,
            color: Color(0xff5B2434),
          ),
          hintText: 'Email',
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  Widget senhaTextField() {
    return Container(
      margin: EdgeInsets.only(left: 65, right: 65, bottom: 15),
      padding: EdgeInsets.only(left: 16, right: 0),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff5B2434), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: TextFormField(
        cursorColor: Colors.black,
        obscureText: esconderSenha,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10),
          suffixIcon: InkWell(
            onTap: () => this.setState(() {
              esconderSenha = !esconderSenha;
            }),
            borderRadius: BorderRadius.circular(25),
            child: Icon(!esconderSenha ? Icons.visibility : Icons.visibility_off,
                color: esconderSenha ? Color(0xff3a3a3a) : Colors.green),
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          icon: Icon(Icons.vpn_key, color: Color(0xff5B2434)),
          hintText: 'Senha',
        ),
      ),
    );
  }

  Widget botoesEntrarERegistrar() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BotaoPadrao(
              titulo: 'Entrar',
              onPressed: this._tocouEntrar,
              fundoBranco: true),
          Container(
            padding: EdgeInsets.all(10),
          ),
          BotaoPadrao(
              titulo: 'Registrar',
              onPressed: this._tocouRegistrar,
              fundoBranco: true),
        ],
      ),
    );
  }

  //EVENTOS DA TELA

  _tocouEntrar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TelaInicial()));
    print('Entrar');
  }

  _tocouRegistrar() {
    Navigator.push(
      context,
      PopupLayout(
        bottom: 20,
        top: 20,
        right: 30,
        left: 30,
        child: PopupContent(
          content: Cadastro(),
        ),
      ),
    );
  }
}

class ExibirLogo extends StatefulWidget {
  bool comAnimacao = false;
  double width;
  double hight;

  ExibirLogo({this.comAnimacao, @required this.width, @required this.hight});

  @override
  _ExibirLogoState createState() => _ExibirLogoState();
}

class _ExibirLogoState extends State<ExibirLogo>
    with SingleTickerProviderStateMixin {
  double _sizeHight;
  double _sizeWidth;

  @override
  void initState() {
    super.initState();
    _sizeHight = widget.comAnimacao ? 10 : widget.hight;
    _sizeWidth = widget.comAnimacao ? 10 : widget.width;
    if (widget.comAnimacao) scheduleMicrotask(this._updateSize);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      width: _sizeHight,
      height: _sizeWidth,
      child: Image(
        image: AssetImage('assets/Logo.png'),
        fit: BoxFit.scaleDown,
        height: _sizeHight,
        width: _sizeWidth,
      ),
    );
  }

  //PRIVADOS

  void _updateSize() async {
    setState(() {
      _sizeHight = widget.hight;
      _sizeWidth = widget.width;
    });
  }
}
