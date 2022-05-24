import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Застосунок для обліку витрат'),
      ),
      body: Dashboard(),
    );
  }
}





// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: const Home(),
//     );
//   }
// }


// // class Item {
// //   String name;
// //   double price;

// //   Item({this.name,
// //        this.itemPrice});
// // }

// class Home extends StatefulWidget {
//   const Home(key) : super(key: key);

//   final String title;

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {




//   List todoList=[];
//   String _userToDo='';

//   @override
//   void initState() {
//     super.initState();
//     todoList.addAll(["Молоко","Хліб","Яблука"]);
//   }

//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//         itemCount: todoList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Dismissible(
//             key: Key(todoList[index]),
//             child: Card(
//             child: ListTile(
//               title: Text(todoList[index]),
//               trailing: IconButton(icon: Icon(
//                 Icons.delete_sweep,
//                 color:Colors.orange
//                 ),onPressed: (){
//                    setState(() {
//               todoList.removeAt(index);
//               });
//                 },
//                 ),
//               ),
//           ),
//            onDismissed: (derection){
//               setState(() {
//               todoList.removeAt(index);
//               });
//            },// Card
//         ); // Dismissible
//       }
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor:Colors.blueAccent,
//         child: Icon(
//           Icons.add_box,
//           color:Colors.white
//         ),
//         onPressed:(){
//           showDialog(context: context, builder: (BuildContext context){
//             return AlertDialog(
//               title: Text('${DateTime.friday}'),
//               content:
              
//               TextField(
//                 textAlign: TextAlign.center,
//                 onChanged: (String value){
//                   _userToDo=value;
//                 },
                
//               ),
//               actions: [
//                 ElevatedButton(onPressed:(){
//                       setState(() {
//                         todoList.add(_userToDo);
//                       });
//                     // Navigat
//                 }, child: Text("Додати"))
//               ],
//             );
//           });
            
//         } 
//       ),  // ListView.builder
//     ); // Scaffold
//     } 
// }
    

    
            
  