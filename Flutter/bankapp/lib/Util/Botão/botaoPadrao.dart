import 'package:flutter/material.dart';

class BotaoPadrao extends StatefulWidget {
  final String titulo;
  final Function onPressed;
  final bool fundoBranco;

  BotaoPadrao({this.titulo, this.onPressed, @required this.fundoBranco});

  @override
  _BotaoPadraoState createState() => _BotaoPadraoState();
}

class _BotaoPadraoState extends State<BotaoPadrao> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: widget.onPressed,
      color: widget.fundoBranco ? Color(0xffffffff) : Color(0xff5B2434),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: widget.fundoBranco ? 0 : 5,
      highlightColor: widget.fundoBranco ? null : Color(0x665B2434),
      splashColor: widget.fundoBranco ? Color(0x665B2434) : null,
      child: Text(
        widget.titulo,
        style: TextStyle(
          fontSize: 16,
          color: widget.fundoBranco ? Color(0xff5B2434) : Color(0xffffffff),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
// FloatingActionButton.extended(
//       onPressed: widget.onPressed,
//       backgroundColor: widget.inverterCor ? Color(0xff5B2434) : Colors.transparent,
//       elevation: widget.inverterCor ? 0 : 100,
//       hoverColor: Colors.white,
//       foregroundColor: Colors.white,
//       focusColor: Colors.white,

//       label: Text(
//         widget.titulo,
//         style: TextStyle(
//           fontSize: 16,
//           color:  widget.inverterCor ? Color(0xffffffff) : Color(0xff5B2434) ,
//           //fontWeight: FontWeight.bold,
//         ),
//       ),
//       //highlightColor: Color(0x665B2434),
//       splashColor: Color(0x665B2434),
//     )
