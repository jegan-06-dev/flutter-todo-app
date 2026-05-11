import 'package:flutter/material.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<String> tasks = [];
  TextEditingController taskcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
          centerTitle: false,
          backgroundColor: Colors.blue,
        ),

        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),

                    child: TextField(
                      controller: taskcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your Task",
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    setState(() {
                      tasks.add(taskcontroller.text);
                      taskcontroller.clear();
                    });
                  },
                  child: Text("Add"),
                ),
              ],
            ),

            Flexible(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text(tasks[index]),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                         child:Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
