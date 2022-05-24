import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import 'form_input_field.dart';

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('Додати новий запис'),
//           content:  Column(
//               children: [
//                   FormInputField(
//                   // itemController: _itemController,
//                   hintText: 'Назва товару',
//                   validateMessage: 'Будь ласка ведіть потрібні дані',
//                   keyboardType: TextInputType.text,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                     DateTimeFormField(
//                   decoration: const InputDecoration(
//                     hintStyle: TextStyle(color: Colors.black45),
//                     errorStyle: TextStyle(color: Colors.redAccent),
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.event_note),
//                     labelText: 'Дата',
//                   ),
//                   firstDate: DateTime.now().add(const Duration(days: 10)),
//                   initialDate: DateTime.now().add(const Duration(days: 10)),
//                   autovalidateMode: AutovalidateMode.always,
//                   validator: (DateTime  e) =>
//                       (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
//                   onDateSelected: (DateTime value) {
//                  print(value);
//                   },
//                 ),
//                   SizedBox(
//                   height: 10,
//                 ),
//                   FormInputField(
//                         // itemController: _priceController,
//                         hintText: 'Ціна',
//                         validateMessage: 'Please provide the price',
//                         keyboardType: TextInputType.numberWithOptions(
//                           decimal: true,
//                         ),
//                       ),
//               ])
//               ,
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),
//       child: const Text('Додати новий елемент'),
//     );
//   }
// }





class Item {
  String itemName;
  String date;
  double itemPrice;

  Item({this.itemName,this.date, this.itemPrice});
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Item> items = [];
  bool sort = false;
  DateTime selectedDate;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _itemController;
  TextEditingController _dateController;
  TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _itemController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
             TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Додати новий запис'),
          content:  Column(
              children: [
                  FormInputField(
                  itemController: _itemController,
                  hintText: 'Назва товару',
                  validateMessage: 'Будь ласка ведіть потрібні дані',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                    DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Дата',
                  ),
                  firstDate: DateTime.now().add(const Duration(days: 10)),
                  initialDate: DateTime.now().add(const Duration(days: 10)),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (DateTime  e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                        setState(() {
                          selectedDate =value;
                        });
                  },
                ),
                  SizedBox(
                  height: 10,
                ),
                  FormInputField(
                        itemController: _priceController,
                        hintText: 'Ціна',
                        validateMessage: 'Please provide the price',
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
              ])
              ,
          actions: <Widget>[
            TextButton(
              onPressed: () { 
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () { 
                if (_formKey.currentState.validate()) {
                          items.add(Item(
                              date: selectedDate.toString(),
                              itemName: _itemController.text,
                              itemPrice: double.parse(_priceController.text)));
                          setState(() {
                            _dateController.clear();
                            _itemController.clear();
                            _priceController.clear();
                          });
                        }
                
                Navigator.pop(context, 'OK');
                },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Додати новий елемент'),
    ),
              //  MyStatelessWidget(),

              //  TextButton(
              //         onPressed: () {
              //           if (_formKey.currentState.validate()) {
              //             items.add(Item(
              //                 date: selectedDate.toString(),
              //                 itemName: _itemController.text,
              //                 itemPrice: double.parse(_priceController.text)));
              //             setState(() {
              //               _dateController.clear();
              //               _itemController.clear();
              //               _priceController.clear();
              //             });
              //           }
              //         },
              //          child: const Text('додати'),
              //       ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DataTable(
            sortColumnIndex: 1,
            sortAscending: sort,
            columns: [
              DataColumn(
                label: Text('Назва товару'),
              ),
               DataColumn(
                label: Text('Дата'),
              ),
              DataColumn(
                numeric: true,
                onSort: (int index, bool ascending) {
                  if (ascending) {
                    items.sort((a, b) => b.itemPrice.compareTo(a.itemPrice));
                  } else {
                    items.sort((a, b) => a.itemPrice.compareTo(b.itemPrice));
                  }
                  setState(() {
                    sort = ascending;
                  });
                },
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Ціна'),
                      ],
                    ),
                  ),
                ),
              ),
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
            ],
            rows:
                mapItemToDataRows(items).toList(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _priceController.dispose();
    _itemController.dispose();
  }

  Iterable<DataRow> mapItemToDataRows(List<Item> items) {
    Iterable<DataRow> dataRows = items.map((item) {
      return DataRow(
          cells: [
        DataCell(
          Text(item.itemName),
        ),
         DataCell(
          Text(item.date),
        ),
        DataCell(
          Text(
            item.itemPrice.toString(),
          ),
        ),
      ]);
    });
    return dataRows;
  }
}