import 'package:flutter/material.dart';
import 'package:to_do_app/screen_2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  List<Map<String, dynamic>> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,

              itemBuilder: (context, index) {

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),

                  child: Padding(
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [

                        Checkbox(
                          value: tasks[index]["done"],

                          onChanged: (value) {
                            setState(() {
                              tasks[index]["done"] = value;
                            });
                          },
                        ),

                        Expanded(
                          child: Text(
                            tasks[index]["title"],
                            style: TextStyle(
                              fontSize: 18,

                              decoration:
                                  tasks[index]["done"]
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            shape: CircleBorder(
              side: BorderSide(color: Colors.white, width: 2),
            ),
            onPressed: () async {

              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Screen2(),
                ),
              );
              if (result != null && result.isNotEmpty) {
                setState(() {
                  tasks.add({
                    "title": result,
                    "done": false,
                  });

                });
              }
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}