import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PopupLayout extends ModalRoute {
  double top;
  double bottom;
  double left;
  double right;
  Color bgColor;
  final Widget child;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor =>
      bgColor == null ? Colors.black.withOpacity(0.5) : bgColor;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  PopupLayout(
      {Key key,
      this.bgColor,
      @required this.child,
      this.top,
      this.bottom,
      this.left,
      this.right});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    if (top == null) this.top = 10;
    if (bottom == null) this.bottom = 20;
    if (left == null) this.left = 20;
    if (right == null) this.right = 20;

    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Material(
        // This makes sure that text and other content follows the material style
        type: MaterialType.transparency,
        //type: MaterialType.canvas,
        // make sure that the overlay content is not cut off
        child: SafeArea(
          //bottom: true,
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: this.bottom,
          //top: this.top,
          right: this.right,
          left: this.left),
      child: Stack(
        children: [
          child,
          Positioned(
            right: -20,
            top: -20,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                radius: 35,
                backgroundColor: Color(0xff5B2434),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
