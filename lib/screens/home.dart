import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../bank_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/bank_card.dart';

GetIt locator = GetIt.instance;

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BankModel model = locator<BankModel>();

  @override
  void initState() {
    super.initState();
    model.fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => model,
        child: Scaffold(
            body: Container(
                color: Color(0xffececec),
                constraints: BoxConstraints.expand(),
                child: Column(children: <Widget>[
                  MainAppBar(),
                  Expanded(child:
                      Consumer<BankModel>(builder: (context, bank, child) {
                    return ListView(
                        padding: EdgeInsets.all(16),
                        children: bank.rates.map((rate) {
                          return BankCard(
                            key: Key(rate.id),
                            name: rate.name,
                            buy: rate.buy.toDouble(),
                            sell: rate.sell.toDouble(),
                          );
                        }).toList());
                  }))
                ]))));
  }
}
