import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui_home/add_user.dart';
import 'dart:convert' as convert;
import 'package:ui_home/login_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List userInformation = <dynamic>[];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async{
    var url = 'http://127.0.0.1:8000/api/users';
    var response = await http.get(Uri.parse(url));

    setState(() {
      userInformation = convert.jsonDecode(response.body) as List<dynamic>;
    });
  }

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
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUser()));
            },
            label: const Text('Add user'),
            backgroundColor: const Color(0xFF00ACC1),
            elevation: 10,
          ),
          body: ListView.builder(
              itemCount: userInformation.length,
              itemBuilder: (context, index){
                final userInformations = userInformation[index] as Map;
                return Card(
                  color: const Color(0xFFE0F7FA),
                  elevation: 10,
                  shadowColor: const Color(0xFF00838F),
                  shape: const StadiumBorder(
                  side: BorderSide(color: Color(0xFF0097A7), width: 2.0),
                  ),
                  margin: const EdgeInsets.all(5),
                  child:  ListTile(
                    leading: Text(userInformation[index]['name'],
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20) ,),
                    subtitle: Text(userInformation[index]['email'],
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    onTap: () async{
                      var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUser()));
                    },
                  ),
                );
              }
          ),
        ));
  }
}
