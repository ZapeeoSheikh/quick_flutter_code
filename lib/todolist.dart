import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<String> taskList = [];
  List<String> taskList2 = [];

  late Future<Database> _database;

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  void _addTask() {
    setState(() {
      if (!_controller.text.isEmpty && !_controller2.text.isEmpty) {
        _database.then((db) {
          db.execute("INSERT INTO tasks(name) VALUES(${_controller.text})");
          db.execute("INSERT INTO tasks(name) VALUES(${_controller2.text})");
        });
        taskList.add(_controller.text);
        taskList2.add(_controller2.text);
        _controller.clear();
        _controller2.clear();
      }
      print("Empty");
    });
  }

  @override
  initState() {
    super.initState();
    _database = Future(() async {
      return openDatabase(
        join(
          await getDatabasesPath(),
          'task_database.db',
        ),
        onCreate: (db, version) {
          db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT)");
        },
        version: 1,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text('Task Management'),
        //   ),
        //   body: Column(
        //     children: <Widget>[
        //       Expanded(
        //         flex: 4,
        //         child: Container(
        //           padding: EdgeInsets.all(10.0),
        //           child: Column(
        //             children: <Widget>[
        //               Expanded(
        //                   child: Row(
        //                 children: <Widget>[
        //                   Expanded(
        //                     child: Column(
        //                       children: <Widget>[
        //                         Container(
        //                           width: double.infinity,
        //                           height: 50.0,
        //                           color: Colors.blue,
        //                           child: Center(
        //                               child: Text('Task',
        //                                   style: TextStyle(
        //                                       color: Colors.white,
        //                                       fontSize: 18.0))),
        //                         ),
        //                         SizedBox(height: 10.0),
        //                         Container(
        //                           width: double.infinity,
        //                           height: 50.0,
        //                           color: Colors.blueGrey,
        //                           child: Center(
        //                               child: Text('To Do',
        //                                   style: TextStyle(
        //                                       color: Colors.white,
        //                                       fontSize: 18.0))),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   SizedBox(width: 10.0),
        //                   Expanded(
        //                     child: Column(
        //                       children: <Widget>[
        //                         Container(
        //                           width: double.infinity,
        //                           height: 50.0,
        //                           color: Colors.amber,
        //                           child: Center(
        //                               child: Text('Status',
        //                                   style: TextStyle(
        //                                       color: Colors.white,
        //                                       fontSize: 18.0))),
        //                         ),
        //                         SizedBox(height: 10.0),
        //                         Container(
        //                           width: double.infinity,
        //                           height: 50.0,
        //                           color: Colors.green,
        //                           child: Center(
        //                               child: Text('Completed',
        //                                   style: TextStyle(
        //                                       color: Colors.white,
        //                                       fontSize: 18.0))),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               )),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         flex: 6,
        //         child: Container(
        //           padding: EdgeInsets.all(20.0),
        //           color: Colors.grey,
        //           child: Column(
        //             children: <Widget>[
        //               TextField(
        //                 decoration: InputDecoration(
        //                   labelText: 'Task Name',
        //                   border: OutlineInputBorder(),
        //                 ),
        //               ),
        //               SizedBox(height: 10.0),
        //               TextField(
        //                 maxLines: 5,
        //                 decoration: InputDecoration(
        //                   labelText: 'Task Description',
        //                   border: OutlineInputBorder(),
        //                 ),
        //               ),
        //               SizedBox(height: 10.0),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: <Widget>[
        //                   ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                       primary: Colors.grey,
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(20.0)),
        //                     ),
        //                     child: Text('Cancel',
        //                         style: TextStyle(color: Colors.white)),
        //                     onPressed: () {},
        //                   ),
        //                   ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                       primary: Colors.blue,
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(20.0)),
        //                     ),
        //                     child: Text('Create',
        //                         style: TextStyle(color: Colors.white)),
        //                     onPressed: () {},
        //                   ),
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // );

        //   Scaffold(
        //   appBar: AppBar(title: Text("To-Do List App"), elevation: 0.0),
        //   body: SingleChildScrollView(
        //     child: Column(
        //       children: <Widget>[
        //         Padding(
        //           padding: const EdgeInsets.all(16.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: <Widget>[
        //               Text("My To-Do List",
        //                   style: TextStyle(
        //                       fontSize: 24.0, fontWeight: FontWeight.bold)),
        //               Row(
        //                 children: <Widget>[
        //                   Icon(Icons.notifications_none,
        //                       size: 24.0, color: Colors.black),
        //                   SizedBox(width: 16.0),
        //                   Icon(Icons.menu,
        //                       size: 24.0, color: Colors.black),
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //         Container(
        //           padding: const EdgeInsets.all(16.0),
        //           color: Colors.grey.shade200,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: <Widget>[
        //               Text("Personal",
        //                   style: TextStyle(
        //                       fontSize: 16.0, fontWeight: FontWeight.bold)),
        //               Icon(Icons.arrow_forward_ios,
        //                   size: 16.0, color: Colors.black),
        //             ],
        //           ),
        //         ),
        //         Container(
        //           color: Colors.white,
        //           child: ListTile(
        //             leading: CircleAvatar(
        //               backgroundImage: NetworkImage(
        //                   "https://avatars2.githubusercontent.com/u/19484515?s=460&v=4"),
        //             ),
        //             title: Text("Michael C. Harris"),
        //             subtitle: Text("@mcharris"),
        //             trailing: Icon(Icons.arrow_forward_ios,
        //                 size: 16.0, color: Colors.black),
        //           ),
        //         ),
        //         SizedBox(height: 16.0),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: <Widget>[
        //             Text("Today",
        //                 style: TextStyle(
        //                     fontSize: 16.0, fontWeight: FontWeight.bold)),
        //             Icon(Icons.arrow_forward_ios,
        //                 size: 16.0, color: Colors.black),
        //           ],
        //         ),
        //         SizedBox(height: 16.0),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: <Widget>[
        //             Text("Tomorrow",
        //                 style: TextStyle(
        //                     fontSize: 16.0, fontWeight: FontWeight.bold)),
        //             Icon(Icons.arrow_forward_ios,
        //                 size: 16.0, color: Colors.black),
        //           ],
        //         ),
        //         SizedBox(height: 16.0),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: <Widget>[
        //             Text("Upcoming",
        //                 style: TextStyle(
        //                     fontSize: 16.0, fontWeight: FontWeight.bold)),
        //             Icon(Icons.arrow_forward_ios,
        //                 size: 16.0, color: Colors.black),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // );

        Scaffold(
      appBar: AppBar(
        title: Text('Fancy ToDo List'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.blue,
                          child: Center(
                              child: Text('Task',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0))),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.blueGrey,
                          child: Center(
                              child: Text('To Do',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.amber,
                          child: Center(
                              child: Text('Status',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0))),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.green,
                          child: Center(
                              child: Text('Completed',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "You've got 0${taskList.length} tasks to do",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 8,
                      color: Colors.blue[50],
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                taskList[index],
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                taskList2[index],
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              _database.then((db) {
                                db.execute(
                                    "DELETE FROM tasks WHERE id = $index");
                              });
                              taskList.removeAt(index);
                              taskList2.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        _addTask();
                      },
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Task Name',
                        contentPadding: const EdgeInsets.all(20.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: _addTask,
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        _addTask();
                      },
                      controller: _controller2,
                      decoration: InputDecoration(
                        hintText: 'Task Details',
                        contentPadding: const EdgeInsets.all(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
