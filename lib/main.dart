import 'package:flutter/material.dart';

void main(){
  runApp(ToDoList());
}

class ToDoList extends StatefulWidget{
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoList();
}

class _ToDoList extends State<ToDoList>{
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();

  // @override
  // void initState(){
  //   super.initState();
  //
  //   _controller.addListener((){});
  // }

  void addTodo(){
    setState(() {
      if (_controller.text.isNotEmpty){
        _todos.add(_controller.text);
        _controller.clear();
      }
    });
  }

  void removeTodo(int index){
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('To Do', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              backgroundColor: Color(0xFF8f001d),
            ),
            body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: ListView.builder(
                          itemCount: _todos.length,
                          itemBuilder: (context, index){
                            return Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black,
                                        width: 1.0
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.1),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(1,1)
                                    )]
                                ),
                                child: ListTile(
                                    leading: Text('${index + 1}'),
                                    title: Text(_todos[index]),
                                    trailing: IconButton(
                                        onPressed: () => removeTodo(index),
                                        icon: Icon(Icons.remove_circle)
                                    )
                                )
                            );
                          },
                        )
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextField(
                          controller: _controller,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'What shall we do today?',
                              // prefixIcon: IconButton(
                              //   onPressed: addTodo,
                              //   icon: Icon(Icons.add)
                              // ),
                              suffixIcon: IconButton(
                                  onPressed: addTodo,
                                  icon: Icon(Icons.add_circle_rounded)
                              )
                          ),
                        )
                    ),
                    SizedBox(height: 25)
                  ],
                )
            )
        )
    );
  }
}
