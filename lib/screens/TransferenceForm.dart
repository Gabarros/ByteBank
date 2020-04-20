import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/Transference.dart';
import 'package:bytebank/screens/TransferencesList.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = "Criando Transferências";

class FormTransference extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTransferenceState();
  }
}

class FormTransferenceState extends State<FormTransference> {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
