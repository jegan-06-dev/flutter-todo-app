import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController taskcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
  padding: const EdgeInsets.all(20),
  child: Row(
    children: [
      Expanded(
        child: TextField(
          controller: taskcontroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter your Task",
          ),
        ),
      ),

      const SizedBox(width: 10),

      ElevatedButton(
         style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
  ),
        onPressed: () {
          if (taskcontroller.text.isNotEmpty) {

          Navigator.pop(context, taskcontroller.text);
        }
        },
        child: const Text("Add", style: TextStyle(fontSize: 18,),),
      ),
    ],
  ),
),
        
        ],
      ),
    );
  }
}
