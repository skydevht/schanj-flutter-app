import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/bank_card.dart';

void main() => runApp(MyApp());

Future<List<BankRate>> fetchRates() async {
  final response = await http.get('https://my.api.mockaroo.com/banks.json',
      headers: {'X-API-Key': 'b9ab26d0'});
  if (response.statusCode == 200) {
    List<dynamic> bankRates = json.decode(response.body);
    return bankRates.map((rate) {
      return BankRate.fromJson(rate);
    }).toList();
  } else {
    throw Exception('Failed to load banks\' rates');
  }
}

class BankRate {
  final String id;
  final num buy;
  final num sell;
  final String name;

  BankRate({
    this.id,
    this.name,
    this.buy,
    this.sell,
  });

  factory BankRate.fromJson(Map<String, dynamic> json) {
    return BankRate(
      id: json['id'],
      name: json['name'],
      buy: json['buy'],
      sell: json['sell'],
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SChanj'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<BankRate>> rates;

  @override
  void initState() {
    super.initState();
    rates = fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xffececec),
            constraints: BoxConstraints.expand(),
            child: Column(children: <Widget>[
              MainAppBar(),
              Expanded(
                  child: FutureBuilder<List<BankRate>>(
                      future: rates,
                      builder: (context, snapshot) {
                        debugPrint(snapshot.toString());
                        return snapshot.hasData
                            ? ListView(
                                padding: EdgeInsets.all(16),
                                children: snapshot.data.map((rate) {
                                  return BankCard(
                                    key: Key(rate.id),
                                    name: rate.name,
                                    buy: rate.buy.toDouble(),
                                    sell: rate.sell.toDouble(),
                                  );
                                }).toList())
                            : Center(child: CircularProgressIndicator());
                      }))
            ])));
  }
}
