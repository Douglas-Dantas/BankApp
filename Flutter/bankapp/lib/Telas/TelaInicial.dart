import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  TelaInicial({Key key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text("Bem vindo, Douglas"),
              Row(
                children: [
                  Expanded(
                    child: saldo(),
                    flex: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: btVerSaldo(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget saldo() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(color: Color(0xffe0e0eb))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Saldo: ",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            "R\$ 1850,50",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget btVerSaldo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffe0e0eb)),
          top: BorderSide(color: Color(0xffe0e0eb)),
          right: BorderSide(color: Color(0xffe0e0eb)),
        ),
      ),
      height: 50,
      width: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 20),
      child: InkWell(
        //onPressed: () => print("tocou"),
        onTap: () => print("tocou"),
        child: Container(
          //color: Colors.blue,
          width: 200,
          height: 50,
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}
