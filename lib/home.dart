import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Map milestoneMap={'test':'test'};

  

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Widget appCard(){
    //String appname,int users,List milestones,List journeys){
    return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color:Colors.amber,
                  child: ListTile(
                    title:Text('app name:'),
                    subtitle:Text('daily users:'),
                    trailing:Icon(Icons.person),
                    leading:Icon(Icons.star)
                  )
                  
                ),
              );}

               void initial() async{

    DatabaseReference postsRef = FirebaseDatabase(databaseURL: 'https://apheria.firebaseio.com/').reference().child(
        "milestones");
    await postsRef.once().then((
        DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      milestoneMap=DATA;

      for (var individualKey in KEYS) {
          //DATA[individualKey]['date'],
          }
        
        

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }


  @override
  Widget build(BuildContext context) {
    
return Scaffold(
  body:Center(
    child: Column(
      children:[
        Center(child: Text('brittAdmin',textAlign:TextAlign.center,style:TextStyle(fontSize:24))),
        Text('milestone map: $milestoneMap'),
        Expanded(
          child: ListView.builder(
                itemCount: 3,
                //milestoneMap.length,
                itemBuilder: (BuildContext context, int index) {

                  return appCard();
          })
        )
      ]
    ),
  )
);
}
}
