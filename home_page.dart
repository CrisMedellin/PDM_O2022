import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum RadioGroupTips { amazing, good, okay }

class _HomePageState extends State<HomePage> {

  RadioGroupTips? _tipPercentage = RadioGroupTips.amazing;
  double tipAmount = 0.00;
  double costOfService = 0.00;
  bool roundUpTip = false;
  bool empty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 8, left: 8),
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Cost of service"),
                onSubmitted: (value) => {
                  if (value != "") {
                    costOfService = double.parse(value),
                    empty = false
                  } else {
                    costOfService = 0.00,
                    empty = true
                  }
                },
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          ListTile(
            title: const Text('Amazing 20%'),
            leading: Radio<RadioGroupTips>(
              activeColor: Colors.green,
              value: RadioGroupTips.amazing,
              groupValue: _tipPercentage,
              onChanged: (RadioGroupTips? value) {
                setState(() {
                  _tipPercentage = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Good 18%'),
            leading: Radio<RadioGroupTips>(
              activeColor: Colors.green,
              value: RadioGroupTips.good,
              groupValue: _tipPercentage,
              onChanged: (RadioGroupTips? value) {
                setState(() {
                  _tipPercentage = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Okay 15%%'),
            leading: Radio<RadioGroupTips>(
              activeColor: Colors.green,
              value: RadioGroupTips.okay,
              groupValue: _tipPercentage,
              onChanged: (RadioGroupTips? value) {
                setState(() {
                  _tipPercentage = value;
                });
              },
            ),
          ),
          SwitchListTile(
            title: Text("Round up tip"),
            secondary: Icon(Icons.credit_card),
            value: roundUpTip,
            onChanged: (bool value) {
              setState(() {
                roundUpTip = value;
                print("Redondeo: $roundUpTip");
              });
            },
          ),
          MaterialButton(
            child: Text("CALCULATE"),
            color: Colors.green,
            textColor: Colors.white,
            onPressed: _tipCalculation,
          ),
          Text("Tip amount: \$$tipAmount", textAlign: TextAlign.right),
        ],
      ),
    );
  }

  void _tipCalculation() {
    setState(() {
      if (!empty) {
        if (_tipPercentage == RadioGroupTips.amazing) {
          tipAmount = double.parse((costOfService * 0.20).toStringAsFixed(2));
        }
        if (_tipPercentage == RadioGroupTips.good) {
          tipAmount = double.parse((costOfService * 0.18).toStringAsFixed(2));
        }
        if (_tipPercentage == RadioGroupTips.okay) {
          tipAmount = double.parse((costOfService * 0.15).toStringAsFixed(2));
        }
        if (roundUpTip) {
          if (tipAmount%1 > 0) tipAmount = tipAmount-(tipAmount%1)+1;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text ("WARNING: Cost of Service empty.")));
      }
    });
  }
}
