import 'dart:convert';

import 'package:cryptoappflutter/btc_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CryptoPage extends StatefulWidget {
  const CryptoPage({super.key});

  @override
  State<CryptoPage> createState() {
    return _CryptoPageState();
  }
}

class _CryptoPageState extends State<CryptoPage> {
  String valorDoBtc = '';

  Future<BtcModel> fetchData() async {
    String apiUrl = 'https://api.coincap.io/v2/assets/bitcoin';

    var response = await http.get(Uri.parse(apiUrl));
    //var response = await rootBundle.loadString('assets/mock_data.json');

    var data = jsonDecode(response.body);

    var btcModel = BtcModel.fromJson(data);

    return btcModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "USD: $valorDoBtc",
              style: TextStyle(fontSize: 20, color: Colors.purple),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => {
                fetchData().then(
                  (value) => {
                    setState(() {
                      valorDoBtc = value.priceUsd;
                    }),
                  },
                ),
              },
              child: Text("Buscar Valor"),
            )
          ],
        ),
      ),
    );
  }
}
