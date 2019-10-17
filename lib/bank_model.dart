import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'models/bank_rate.dart';

class BankModel extends ChangeNotifier {
  final List<BankRate> _rates = [];

  UnmodifiableListView<BankRate> get rates => UnmodifiableListView(_rates);

  void fetchRates() async {
    final response = await http.get('https://my.api.mockaroo.com/banks.json',
        headers: {'X-API-Key': 'b9ab26d0'});
    if (response.statusCode == 200) {
      List<dynamic> bankRates = json.decode(response.body);
      this._rates.clear();
      this._rates.addAll(bankRates.map((rate) {
            return BankRate.fromJson(rate);
          }).toList());
      notifyListeners();
    } else {
      throw Exception('Failed to load banks\' rates');
    }
  }
}
