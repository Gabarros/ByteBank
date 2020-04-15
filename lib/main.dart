import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: TransferencesList(),
        appBar: AppBar(
          title: Text(
            'Transferências',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ));

class TransferencesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransferenceItem(Transference(300, 123455)),
        TransferenceItem(Transference(500, 1387713)),
        TransferenceItem(Transference(800, 145678)),
      ],
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

class Transference{
  final double value;
  final int accountNumber;

  Transference(this.value, this.accountNumber);
}
