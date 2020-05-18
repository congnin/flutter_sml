import 'package:flutter/material.dart';

class ProfileCardAlignment extends StatelessWidget {
  final int cardNum;

  const ProfileCardAlignment(this.cardNum);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
              child: Material(
            child: Image.asset(
              'assets/portrait.jpeg',
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12.0),
          )),
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Card number $cardNum',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8.0)),
                  Text('A short description.',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
