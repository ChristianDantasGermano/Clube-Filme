import 'package:flutter/material.dart';

class ScoreViewWidget extends StatelessWidget {
  final String title;
  final String nota;
  final Color cor;

  ScoreViewWidget({
    required this.nota,
    required this.title,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: cor,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: cor,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 4.0),
            blurRadius: 6.0, // changes position of shadow
          ),
        ],
      ),
      width: 60.0,
      height: 60.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                nota,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ],
      ),
    );
  }
}
