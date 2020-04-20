import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferencesList(),
      ),
    );
  }
}

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
          'Transferências',
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
          final Future<Transference> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransference();
          }));

          future.then((transference) {
            _transferences.add(transference);
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

class Transference {
  final double value;
  final int accountNumber;

  Transference(this.accountNumber, this.value);

  @override
  String toString() {
    return 'Transferência{value: $value, accountNumber: $accountNumber';
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
          Editor(
            controller: _controllerAccountNumber,
            label: 'Número da Conta',
            hint: '000000',
          ),
          Editor(
              controller: _controllerValue,
              label: 'Valor',
              hint: '00.00',
              icon: Icons.monetization_on),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Confirmar'),
                  onPressed: () => _createTransference(context),
                  textTheme: ButtonTextTheme.primary,
                ),
                RaisedButton(
                  child: Text('Voltar'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return TransferencesList();
                      }),
                    );
                  },
                  textTheme: ButtonTextTheme.primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _createTransference(BuildContext context) {
    final int number = int.tryParse(_controllerAccountNumber.text);
    final double value = double.tryParse(_controllerValue.text);

    if (number != null && value != null) {
      final transference = Transference(number, value);
      Navigator.pop(context, transference);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final IconData icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 40, top: 20),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
        maxLength: 6,
      ),
    );
  }
}
