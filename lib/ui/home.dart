

import 'package:flutter/material.dart';

class ListView_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View and Dialogue'),
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.menu,color: Colors.white,size: 30,),
      ),
      body: Container(
        color: Colors.grey,
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, int index)
        {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              title: Text('This is title text',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Text('This is subtitle'),
              leading: Icon(Icons.alarm,size: 35,color: Colors.black,),
              trailing: FlatButton(child: Icon(Icons.delete_forever,
                size: 35,color: Colors.red,),
                onPressed: (){
                  Dialogue(context: context,message: 'Are you sure to delete?').then((value) =>
                  print('Selected Value : $value')
                  );
                },
              ),
              
            ),

          );
        }),
      ),
    );
  }

  Future<bool> Dialogue({BuildContext context, String message})
  {
    return showDialog(
      context: context,
      builder: (context)
        {
          return AlertDialog(
            title: Text('$message'),
            actions: [
              FlatButton(
                child: Text('Yes'),
                onPressed: ()
                {
                  Navigator.of(context).pop(true);
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: ()
                {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        }
    );
  }
}
