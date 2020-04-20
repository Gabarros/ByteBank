import 'package:bytebank/models/Transference.dart';
import 'package:flutter/material.dart';

import 'TransferenceForm.dart';

const _appBarTitle = "Transferências";

class TransferencesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferencesListState();
  }
}

class TransferencesListState extends State<TransferencesList> {
  final List<Transference> _transferences = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: _transferences.length,
        itemBuilder: (context, index) {
          final transference = _transferences[index];
          return TransferenceItem(transference);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransference();
          })).then((transference) {
            if (transference != null &&
                transference.value != 0 &&
                transference.accountNumber != 0) {
              setState(() {
                _transferences.add(transference);
              });
            }
          });
        },
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
