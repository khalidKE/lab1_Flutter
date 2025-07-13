import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int _completedTasksCount = 0;
  final List<Map<String, String>> _tasks = [
    {'title': 'Go to Gym', 'subtitle': 'Morning workout (6:00 AM)'},
    {'title': 'Study Flutter', 'subtitle': 'Complete Lab 1 (2 hours)'},
    {'title': 'Buy Groceries', 'subtitle': 'Milk, Eggs, Bread'},
    {'title': 'Read a Book', 'subtitle': 'Chapter 3 of "The Martian"'},
    {'title': 'Call Mom', 'subtitle': 'Quick chat (Evening)'},
    {'title': 'Plan Weekend', 'subtitle': 'Research hiking trails'},
  ];

  void _incrementCounter() {
    setState(() {
      _completedTasksCount++;
    });
    _showSnackBar('Tasks completed: $_completedTasksCount');
  }

  void _decrementCounter() {
    setState(() {
      if (_completedTasksCount > 0) {
        _completedTasksCount--;
      }
    });
    _showSnackBar('Tasks completed: $_completedTasksCount');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
         
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.local_offer, color: Colors.red, size: 30),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '20% OFF',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text('My Tasks'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushReplacementNamed(context, '/tasks');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]['title']!),
                  subtitle: Text(_tasks[index]['subtitle']!),
                  leading: const Icon(Icons.check_circle_outline),
                  onTap: () {
                  
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Completed Tasks: $_completedTasksCount',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 80), 
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _decrementCounter,
            heroTag: 'decrementBtn', 
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            heroTag: 'incrementBtn', 
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
