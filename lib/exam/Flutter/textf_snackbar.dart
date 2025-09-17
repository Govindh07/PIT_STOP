import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: TextfieldSnackbar()));
}

class TextfieldSnackbar extends StatefulWidget {
  const TextfieldSnackbar({super.key});
  @override
  State<TextfieldSnackbar> createState() => _TextfieldSnackbarState();
}


class _TextfieldSnackbarState extends State<TextfieldSnackbar> {


  final TextEditingController _controller = TextEditingController();
  void _showMessage() {
    if(_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter some text"))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You typed ${_controller.text}"))
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextField with Snackbar")),
      
      body: Padding(padding: EdgeInsets.all(30),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Enter Text",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
          ),

          SizedBox(height: 20),
          ElevatedButton(onPressed: _showMessage, child: Text("Show Snackbar"))
        ],
      ),
      ),
    );
  }
}
