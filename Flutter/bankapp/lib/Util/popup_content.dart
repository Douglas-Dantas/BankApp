import 'package:flutter/material.dart';

class PopupContent extends StatefulWidget {
  final Widget content;
  
  PopupContent({@required this.content});

  @override
  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}
