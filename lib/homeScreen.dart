import 'package:flutter/material.dart';
import 'package:to_do_list/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildTile(int index)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children : [
          ListTile(
          title: Text('Task Title'),
          subtitle: Text('July 23,2021 . High'),
          trailing: Checkbox(
            onChanged: (value) {
              print(value);
            },
            activeColor: Theme.of(context).primaryColor,
            value: true,

          ),
        ),
          Divider(
            color: Theme.of(context).primaryColor,
          ),
    ]
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To Do List'),

        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (_)=>AddTaskScreen()));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: 10,
            itemBuilder: (BuildContext context,int index){
              if(index==0){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Tasks',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('1 of 10',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      )
                    ],
                  ),
                );
              }
              return buildTile(index);
            }

        )


    );
  }
}
