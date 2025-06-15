import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget{
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  String displayText = "No text data";

  List<String> taskList = []; 
  TextEditingController textController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To-Do List App",
          style: TextStyle(
            color: Colors.white),
          ),
          backgroundColor: Colors.black,
          
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textController,
              decoration: InputDecoration(label: Text("Enter a Task"),
                border: OutlineInputBorder()
              ),
            ),
            ),
                ),
                

            MaterialButton(
              color: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(120)),
              onPressed: (){
                setState(() {
                  // displayText = textController.text;
                  taskList.add(textController.text);
                  textController.clear();
                });
              }, 
              child: Text("Add"),
              ),
              ],
            ),
            
            

            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (content, index){
                  return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10), 
                      child: Text(taskList[index]),
                    ),
                  ), 
              
                  MaterialButton(
                    child: Icon(Icons.delete, color: Colors.red,),
                    onPressed: (){
                      setState(() {
                        taskList.removeAt(index);
                      });
                    },
                    )
                ]);
                },
                ),
            ),

          ],
        ),
      ),
    );
  }
}
