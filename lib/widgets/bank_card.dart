import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 4),
                blurRadius: 10,
              )
            ]),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                        bottom: 24,
                      ),
                      width: 160,
                      decoration: BoxDecoration(
                          color: Color(0xff1e2749),
                          borderRadius: BorderRadius.only(
                            topRight: const Radius.circular(30),
                            bottomRight: const Radius.circular(30),
                          )),
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          child: Text('Sogebank',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Column(children: <Widget>[
                          Text('Buy',
                              style: TextStyle(
                                color: Color(0xff969696),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('91.75',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.81),
                                fontSize: 48,
                                fontWeight: FontWeight.w500,
                              )),
                        ])),
                        Container(width: 12),
                        Expanded(
                          child: Column(children: <Widget>[
                            Text('Sell',
                                style: TextStyle(
                                  color: Color(0xff969696),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text('91.75',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.81),
                                  fontSize: 48,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                        )
                      ])
                ])));
  }
}
