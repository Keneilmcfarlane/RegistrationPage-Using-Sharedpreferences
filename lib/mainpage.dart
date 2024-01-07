
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDashboard(),
    );
  }
}
class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}
class _MyDashboardState extends State<MyDashboard> {

  SharedPreferences? logindata;
  String? firstname;
  String? lastname;
  String? gender;
  
  String? dob;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      firstname = logindata!.getString('firstname');
      lastname = logindata!.getString('lastname');
      gender = logindata!.getString('gender');
      
      dob = logindata!.getString('dob');


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Registration completed   :)  "),
       ),
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Text(
                "$firstname",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
               Text(
                "$lastname",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
               Text(
                "$gender",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
               Text(
                "$dob",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            MaterialButton(
              textColor: Colors.white,
                color: Colors.blue,
              onPressed: () {
                logindata!.setBool('login', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MyLoginPage()));
              },
              child: const Text('LogOut'),
            )
          ],
        ),
      ),
    ));
    
  }
}


     

