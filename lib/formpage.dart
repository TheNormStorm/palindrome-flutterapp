import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _pnumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildInputField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter number'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter only numbers!';
        }
        if (RegExp(r'[^0-9]').hasMatch(value)) {
          return 'Please enter a valid number!';
        }
      },
      onSaved: (String value) {
        _pnumber = value;
      },
    );
  }

// ignore: missing_return
  void callPalindrome(_pnumber) {
    int p = int.parse(_pnumber);
    int rev = 0, sum = 0, temp = p;

    while (p > 0) {
      sum = (sum * 10) + (p % 10);
      p = (p / 10).floor();
      print(p);
    }

    if (temp == sum) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Result"),
                content: Text("Number is a Palindrome."),
                actions: [
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
    }
    else
  //  if (temp != sum) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Result"),
                content: Text("Number is not a Palindrome."),
                actions: [
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Palindrome Test"))),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildInputField(),
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        callPalindrome(_pnumber);
                      },
                    ),
                  ],
                ))));
  }
}
