import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormTransference(),
      ),
    );
  }
}

class FormTransference extends StatelessWidget {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criando Transferências',
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: TextField(
              controller: _controllerAccountNumber,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '000000',
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              controller: _controllerValue,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '00,00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                final int number = int.tryParse(_controllerAccountNumber.text);
                final double value = double.tryParse(_controllerValue.text);

                if (number != null && value != null) {
                  final transference = Transference(value, number);
                  debugPrint(transference.toString());

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(transference.toString()),
                  ));
                }
              },
              textTheme: ButtonTextTheme.primary,
            ),
          )
        ],
      ),
    );
  }
}

class TransferencesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transferências',
        ),
      ),
      body: Column(
        children: <Widget>[
          TransferenceItem(Transference(300, 123455)),
          TransferenceItem(Transference(500, 1387713)),
          TransferenceItem(Transference(800, 145678)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferenceItem extends StatelessWidget {
  final Transference _transference;

  TransferenceItem(this._transference);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transference.value.toString()),
        subtitle: Text(_transference.accountNumber.toString()),
      ),
    );
  }
}

class Transference {
  final double value;
  final int accountNumber;

  Transference(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transferência{valor: $value, numeroConta: $accountNumber';
  }
}
