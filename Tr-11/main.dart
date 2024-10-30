import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App Part 2',
      theme: ThemeData.dark(),
      home: const TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<Map<String, dynamic>> _todoList = [];
  final TextEditingController _controller = TextEditingController();
  String _priority = 'Normal';  // Default priority

  void _addTodoItem(String task, String priority) {
    setState(() {
      _todoList.add({'task': task, 'priority': priority, 'completed': false});
    });
    _controller.clear();
  }

  void _toggleComplete(int index) {
    setState(() {
      _todoList[index]['completed'] = !_todoList[index]['completed'];
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  // Student Activity 1: Customize Priority Colors
  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        // Uncomment the line below to customize color for High priority
        // return Colors.yellowAccent.withOpacity(0.2);
        return Colors.redAccent.withOpacity(0.2);
      case 'Normal':
        // Uncomment the line below to customize color for Normal priority
        // return Colors.greenAccent.withOpacity(0.2);
        return Colors.blueAccent.withOpacity(0.2);
      case 'Low':
        // Uncomment the line below to customize color for Low priority
        // return Colors.blueAccent.withOpacity(0.2);
        return Colors.greenAccent.withOpacity(0.2);
      default:
        return Colors.blueAccent.withOpacity(0.2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Student Activity 2: Add Task Count Display
        title: Text('To-Do List' /* + ' (${_todoList.length})'*/),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Add a new task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: _priority,
                  onChanged: (String? newValue) {
                    setState(() {
                      _priority = newValue!;
                    });
                  },
                  items: <String>['High', 'Normal', 'Low']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addTodoItem(_controller.text, _priority);
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                final todoItem = _todoList[index];
                return Card(
                  color: _getPriorityColor(todoItem['priority']),
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    // Student Activity 3: Change Font Style of Completed Tasks
                    title: Text(
                      todoItem['task'],
                      style: TextStyle(
                        fontSize: 18,
                        decoration: todoItem['completed']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        // Uncomment the line below to apply italic style to completed tasks
                        // fontStyle: todoItem['completed'] ? FontStyle.italic : FontStyle.normal,
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        todoItem['completed']
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: todoItem['completed'] ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        _toggleComplete(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _removeTodoItem(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
