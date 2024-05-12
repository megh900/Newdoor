import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> selectedValues = [];
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  void _onButtonPressed() async {
    List<String>? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Select Options'),
              content: Column(
                children: options.map((String option) {
                  return CheckboxListTile(
                    title: Text(option),
                    value: selectedValues.contains(option),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            selectedValues.add(option);
                          } else {
                            selectedValues.remove(option);
                          }
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Close the dialog and return the selected values
                    Navigator.of(context).pop(selectedValues);
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );

    // Handle the selected values returned from the dialog
    if (result != null) {
      setState(() {
        selectedValues = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected values: ${selectedValues.join(', ')}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Additional action for the FloatingActionButton if needed
          print('FloatingActionButton pressed!');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: _onButtonPressed,
          child: Text('Press Me'),
        ),
      ),
    );
  }
}
