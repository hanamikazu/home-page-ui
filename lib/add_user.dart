import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4DD0E1),
                  Color(0xFF80DEEA),
                  Color(0xFFB2EBF2),
                  Color(0xFFE0F7FA),
                ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Profiles',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            toolbarHeight: 50,
            elevation: 0.5,
            backgroundColor: const Color(0xFF00ACC1),
            shadowColor: const Color(0xFF00838F),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                )
            ),
          ),
          body: ListView.builder(
            itemCount: 3,
              itemBuilder: (context, index){
              return const Card(
                color: Color(0xFFE0F7FA),
                elevation: 5,
                shadowColor: Color(0xFF00838F),
                shape: StadiumBorder(
                side: BorderSide(color: Color(0xFF0097A7), width: 2.0),
                  ),
                margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Text("TITLE HERE",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20) ,),
                    subtitle: Text("SUBTITLE HERE",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
    );
        })
    ));
  }
}
