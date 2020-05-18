import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class  Helplineno extends StatefulWidget {
  @override
  _HelplinenoState createState() => _HelplinenoState();
}

class _HelplinenoState extends State< Helplineno> {
@override
  Widget build(BuildContext context) {

    return Scaffold(
    
                body: BodyLayout(),
      
    );
  }
}
 
class BodyLayout extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return _myListview(context);
  }
}

Widget _myListview(BuildContext context){

  // STATIC LIST 
  // return ListView(
  //   children: <Widget>[
  //     ListTile(
  //       title: Text('Sun'),  
 
  //     ),
  //     ListTile(
  //       title: Text("Moon"),
  //     ),
  //     ListTile(
  //       title: Text('Star'),  
 
  //     ),
 
  //   ],
 
  // );
// STATIC LIST WITH DIVIDERS
 return ListView(
 
    children: ListTile.divideTiles(
      context: context,

      tiles:[
        ListTile(
          
          leading: Icon(Icons.assignment_ind),
          title: Text("POLICE"),
          subtitle: Text("100"),
          trailing: IconButton(icon: Icon(Icons.call), onPressed: () => launch("tel://100" ),

         )
          ),
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text("AMBULANCE"),
          subtitle: Text("102"),
          trailing: IconButton(icon: Icon(Icons.call), onPressed: () => launch("tel://102" ),
         )
          ),
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text("WOMEN HELPLINE"),
          subtitle: Text("1091"),
          trailing: IconButton(icon: Icon(Icons.call), onPressed: () => launch("tel://1091" ),
          )
          ),
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text("FIRE"),
          subtitle: Text("101"),
          trailing: IconButton(icon: Icon(Icons.call), onPressed: () => launch("tel://101" ),

         )
          ),
         
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text("DISASTER HELPLINE"),
          subtitle: Text("108"),
          trailing: IconButton(icon: Icon(Icons.call), onPressed: () => launch("tel://108" ),

         )
          ),
      ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text("SENIOR CITIZEN HELPLINE"),
          subtitle: Text("139"),
          trailing: IconButton(icon: Icon(Icons.call), onPressed: () => launch("tel://139" ),

         )
          ),
    ]
 
    ).toList(),
 
  );
 
// INFINITE LIST DYNAMIC
 
// return ListView.builder(
 
// itemBuilder: (context, index){
//   return ListTile(
//     title: Text("row number is $index"),
//   );
// },
 
// );
}